using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PJTraSua
{
    public partial class LienHe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strCon = ConfigurationManager.ConnectionStrings["TraSuaDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    string sql = "SELECT SDT, EmailAdmin FROM ThongTinLienHe WHERE ID = 1";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        // lblSDT và lblEmail là ID của Label trong file .aspx của bạn
                        lblSDT.Text = dr["SDT"].ToString();
                        lblEmail.Text = dr["EmailAdmin"].ToString();
                    }
                    dr.Close();
                }
            }

        }
        protected void btnVeTrangChu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}