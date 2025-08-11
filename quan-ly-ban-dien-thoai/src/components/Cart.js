import React from "react";

function Cart({
  cartItem,
  onRemoveFromCart,
  onDecreaseQuantity,
  onIncreaseQuantity,
}) {
  // Tính tổng tiền của tất cả các sản phẩm trong giỏ hàng
  // cartItems.reduce() là một hàm giúp cộng dồn các giá trị trong mảng
  // Mỗi lần duyệt qua một sản phẩm (item), ta cộng giá (item.price) vào tổng (sum)
  // Giá trị ban đầu của tổng là 0
  const total = cartItem.reduce(
    (sum, item) => sum + item.price * item.quantity,
    0
  );

  return (
    // Phần tử bao ngoài toàn bộ giỏ hàng, có margin phía trên 40px để tạo khoảng cách
    <div style={{ marginTop: 40 }}>
      <h2>🛒 Giỏ hàng</h2>
      {/* Kiểm tra giỏ hàng có rỗng không bằng cách xem độ dài mảng */}
      {/* Nếu không có sản phẩm nào trong giỏ (length === 0), hiển thị thông báo */}
      {cartItem.length === 0 ? (
        <p>Chưa có sản phẩm nào trong giỏ.</p>
      ) : (
        // Nếu giỏ không rỗng (tức là có ít nhất 1 sản phẩm), hiển thị danh sách

        <div>
          {/* Danh sách sản phẩm sẽ được hiển thị dưới dạng danh sách có đánh dấu đầu dòng (ul) */}
          <ol>
            {/* Dùng map() để duyệt qua từng sản phẩm trong mảng cartItems */}
            {/* Với mỗi sản phẩm (item), React sẽ render ra một <li> */}
            {/* "index" là chỉ số của sản phẩm trong mảng – dùng làm key duy nhất cho React */}
            {cartItem.map((item, index) => (
              <li key={index}>
                {item.name} (x{item.quantity}) -{" "}
                {(item.price * item.quantity).toLocaleString()}đ
                <div style={{ display: "inline-block", marginLeft: 10 }}>
                  <button onClick={() => onDecreaseQuantity(index)}>-</button>
                  <button onClick={() => onIncreaseQuantity(index)}>+</button>
                  <button onClick={() => onRemoveFromCart(index)}>Xóa</button>
                </div>
              </li>
            ))}
          </ol>
          <p>
            <strong>Tổng tiền: </strong>
            {total.toLocaleString()}đ
          </p>
        </div>
      )}
    </div>
  );
}

export default Cart;
