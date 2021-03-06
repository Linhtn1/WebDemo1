﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using WebDemo.Model;

namespace WebDemo.View
{
    /// <summary>
    /// Summary description for DoAction
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class DoAction : System.Web.Services.WebService
    {

        [WebMethod]
        public string GetCateGory(string CatParent)
        {
            DBEntities aDbEntities = new DBEntities();
            List<tblCategory> aListCategories = new List<tblCategory>();
            List<tblCategory> aListTemp;
            foreach (tblCategory aTemp in aDbEntities.tblCategories.Where(a => a.CatParent == "0").ToList())
            {
                aListCategories.Add(aTemp);
                string ID = aTemp.ID.ToString();
                aListTemp = aDbEntities.tblCategories.Where(a => a.CatParent == ID).ToList();
                aListCategories.AddRange(aListTemp);
            }
            string json = new JavaScriptSerializer().Serialize(aListCategories);
            return json;
        }
    }
}
