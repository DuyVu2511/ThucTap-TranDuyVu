import React from "react";

// Định nghĩa component ProductCard nhận props là: product và onAddToCart
function ProductCard({ product, onAddToCart }) {
  return (
    <div style={{ border: "1px solid #ccc", padding: 16, width: 200 }}>
      <img src={product.image} alt={product.name} width="100%" />
      <h3>{product.name}</h3>
      <p>Giá: {product.price.toLocaleString()}đ</p>
      <button onClick={() => onAddToCart(product)}>Thêm vào giỏ</button>
    </div>
  );
}

export default ProductCard;
