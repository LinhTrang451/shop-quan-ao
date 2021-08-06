using SE1436_Group4_Assigment.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class AddNewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataToDdlDanhMuc();
            }
        }

        protected void btnUpLoad_Click(object sender, EventArgs e)
        {
            txtUrl.Text = FileUpload1.FileName.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            string tensanpham = txtTenSanPham.Text;
            string image = "/images/" + txtUrl.Text;
            double price = Convert.ToDouble(txtPrice.Text);
            string size = txtSize.Text;
            int catID = Convert.ToInt32(ddlDanhMuc.SelectedValue.ToString());
            SanPhamDAO.CreateProduct(catID, tensanpham, size, image, price);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Add New Product Success')", true);
            Response.Redirect("ListProduct.aspx");

        }
        public void LoadDataToDdlDanhMuc()
        {
            ddlDanhMuc.DataSource = SanPhamDAO.GetAllDanhMucSanPham();
            ddlDanhMuc.DataTextField = "TenDanhMuc";
            ddlDanhMuc.DataValueField = "MaDanhMuc";
            ddlDanhMuc.SelectedIndex = 0;
            ddlDanhMuc.DataBind();
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtPrice.Text = "";
            txtSize.Text = "";
            txtTenSanPham.Text = "";
            txtUrl.Text = "";
            ddlDanhMuc.SelectedIndex = 0;
        }
    }
}