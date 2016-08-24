using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDemo.View
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        DoAction aDoAction = new DoAction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string rs = aDoAction.GetCateGory("0");
                //if (rs != "")
                //{
                //    ListMenuLv1.Value = rs;
                //}
                //else
                //{
                //    Response.Redirect("Trangloi.aspx");
                //}
            }
        }
    }
}