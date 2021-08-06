using SE1436_Group4_Assigment.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataForUpdate();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadDataToDdlDanhMuc();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
                    string tensanpham = txtTenSanPham.Text;
                    string image = "/images/" + txtUrl.Text;
                    double price = Convert.ToDouble(txtPrice.Text);
                    string size = txtSize.Text;
                    int catID = Convert.ToInt32(ddlDanhMuc.SelectedValue.ToString());
                    int aid = Convert.ToInt32(Request.QueryString["aid"]);
                    SanPhamDAO.UpdateProduct(aid, catID, tensanpham, size, image, price);
                    /*Show message*/
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Update Product Success')", true);
            Response.Redirect("ListProduct.aspx");
        }
        public bool SaveProductPhoto()
        {
            if (FileUpload1.FileName.Length > 0)
            {
                string fileName = FileUpload1.PostedFile.FileName.ToString();
                string fileExt = System.IO.Path.GetExtension(FileUpload1.FileName.ToString());
                if (fileName.Length > 96)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The Length is so long')", true);
                    return false;
                }
                else if (fileExt != ".PNG")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The file name is not correct')", true);
                    return false;
                }
                else if (fileExt != ".jpg")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The file name is not correct')", true);
                    return false;
                }
                else if (fileExt != ".png")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The file name is not correct')", true);
                    return false;
                }
                else if (FileUpload1.PostedFile.ContentLength > 4000000)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File Data upload is so big')", true);
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return false;
            }
        }
        protected void btnUpLoad_Click(object sender, EventArgs e)
        {
            txtUrl.Text = FileUpload1.FileName.ToString();
        }
        public void LoadDataToDdlDanhMuc()
        {
            ddlDanhMuc.DataSource = SanPhamDAO.GetAllDanhMucSanPham();
            ddlDanhMuc.DataTextField = "TenDanhMuc";
            ddlDanhMuc.DataValueField = "MaDanhMuc";
            ddlDanhMuc.DataBind();
        }
        public void LoadDataForUpdate()
        {
            LoadDataToDdlDanhMuc();
            int aid = Convert.ToInt32(Request.QueryString["aid"]);
            DataTable data = SanPhamDAO.GetSanPhamById(aid);
            foreach (DataRow dataRow in data.Rows)
            {
                foreach (ListItem item in ddlDanhMuc.Items)
                {
                    if (item.Value.ToString().Equals(dataRow["MaDanhMuc"].ToString()))
                    {
                        item.Selected = true;
                    }
                }
                txtTenSanPham.Text = dataRow["TenSanPham"].ToString();
                txtPrice.Text = dataRow["Gia"].ToString();
                txtSize.Text = dataRow["Size"].ToString();
                txtUrl.Text = dataRow["ImgUrl"].ToString();
                txtImage.ImageUrl = dataRow["ImgUrl"].ToString();
            }
        }

        protected void txtTenSanPham_TextChanged(object sender, EventArgs e)
        {

        }
    }
    
}