import React, { useState } from "react";
import products from "./data/products";
import ProductCard from "./components/ProductCard";
import Cart from "./components/Cart";

function App() {
  // Khởi tạo state "cart" để lưu danh sách sản phẩm đã thêm vào giỏ
  // useState([]): ban đầu giỏ hàng rỗng
  const [cart, setCart] = useState([]);
  // Hàm xử lý khi người dùng nhấn nút "Thêm vào giỏ"
  const handleAddToCart = (product) => {
    // Tìm sản phẩm đã tồn tại trong giỏ hay chưa
    // Tìm theo id sản phẩm (item.id === product.id)
    const existingIndex = cart.findIndex((item) => item.id === product.id);
    // Nếu sản phẩm đã có trong giỏ:
    // - Tạo bản sao mảng giỏ hàng
    // - Tăng quantity của sản phẩm đó thêm 1

    if (existingIndex !== -1) {
      const updateCart = [...cart];
      updateCart[existingIndex].quantity += 1;
      setCart(updateCart);
    } else {
      // Nếu sản phẩm CHƯA có trong giỏ:
      // - Thêm sản phẩm mới vào cuối mảng
      // - Gán quantity mặc định là 1
      setCart([...cart, { ...product, quantity: 1 }]);
    }

    // Hiển thị thông báo cho người dùng biết đã thêm vào giỏ
    alert(`Đã thêm "${product.name}" vào giỏ hàng`);
  };
  // Hàm xử lý khi người dùng muốn xóa sản phẩm khỏi giỏ hàng
  const handleRemoveFromCart = (indexToRemove) => {
    // Hiển thị hộp thoại xác nhận: nếu người dùng bấm "OK" thì tiếp tục xóa
    const isConfirmed = window.confirm(
      "Bạn có chắc chắn muốn xóa sản phẩm khỏi giỏ hàng?"
    );

    if (isConfirmed) {
      // Dùng hàm filter để tạo mảng mới không chứa sản phẩm bị xoá
      // Cụ thể: chỉ giữ lại những sản phẩm có index khác với indexToRemove
      const updateCart = cart.filter((_, index) => index !== indexToRemove);
      // Cập nhật lại state giỏ hàng với mảng mới đã xoá
      setCart(updateCart);
    }
  };
  // 🔼 HÀM TĂNG SỐ LƯỢNG
  const handleIncreaseQuantity = (index) => {
    // Tạo bản sao giỏ hàng hiện tại
    const updateCart = [...cart];
    // Tăng số lượng sản phẩm tại vị trí index
    updateCart[index].quantity += 1;
    // Cập nhật lại state giỏ hàng
    setCart(updateCart);
  };
  // 🔽 HÀM GIẢM SỐ LƯỢNG
  const handleDecreaseQuantity = (index) => {
    // Tạo bản sao giỏ hàng
    const updateCart = [...cart];
    // Nếu số lượng > 1 → giảm bình thường
    if (updateCart[index].quantity > 1) {
      updateCart[index].quantity -= 1;
      setCart(updateCart);
    } else {
      // Nếu số lượng đang là 1 → hỏi người dùng có muốn xoá không
      const isConfirmed = window.confirm("Bạn có muốn xóa sản phẩm này?");
      if (isConfirmed) {
        // Xóa sản phẩm khỏi giỏ hàng (dùng splice để xoá theo index)
        updateCart.splice(index, 1);
        setCart(updateCart);
      }
    }
  };
  return (
    <div style={{ padding: 20 }}>
      {/* Tiêu đề trang */}
      <h1>Cửa hàng điện thoại</h1>
      {/* Hiển thị danh sách sản phẩm ra màn hình */}
      <div
        style={{
          display: "flex", // hiển thị theo hàng ngang
          gap: 20, // khoảng cách giữa các sản phẩm
        }}
      >
        {/* Duyệt qua mảng sản phẩm và hiển thị từng sản phẩm bằng ProductCard */}
        {products.map((sp) => (
          <ProductCard key={sp.id} product={sp} onAddToCart={handleAddToCart} />
        ))}
      </div>
      {/* Truyền prop cartItems cho Cart (cart là state giỏ hàng)
      Nhờ vậy, Cart có thể nhận dữ liệu để hiển thị */}
      <Cart
        cartItem={cart}
        onRemoveFromCart={handleRemoveFromCart}
        onIncreaseQuantity={handleIncreaseQuantity}
        onDecreaseQuantity={handleDecreaseQuantity}
      />
    </div>
  );
}

export default App;
