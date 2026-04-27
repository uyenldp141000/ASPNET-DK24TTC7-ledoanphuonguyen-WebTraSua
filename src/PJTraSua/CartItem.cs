using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PJTraSua 
{
    public class CartItem
    {
        // Mã sản phẩm
        public int ProductID { get; set; }

        // Tên sản phẩm
        public string ProductName { get; set; }

        // Hình ảnh sản phẩm (để hiển thị trong giỏ hàng cho đẹp)
        public string ImageUrl { get; set; }

        // Giá bán
        public double Price { get; set; }

        // Số lượng khách đặt mua
        public int Quantity { get; set; }

        // Thành tiền (Tự động tính = Giá * Số lượng)
        public double Total
        {
            get { return Price * Quantity; }
        }
    }
}