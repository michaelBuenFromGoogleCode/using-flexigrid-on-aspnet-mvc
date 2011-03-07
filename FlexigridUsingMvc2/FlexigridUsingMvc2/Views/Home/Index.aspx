<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">


    <link href="<%: Url.Content("~/Content/Site.css")%>" rel="stylesheet" type="text/css" />
    <script src="<%: Url.Content("~/Scripts/jquery-1.4.1.min.js")%>" type="text/javascript"></script>
    <script src="<%: Url.Content("/Scripts/flexigrid/flexigrid.pack.js")%>" type="text/javascript"></script>
    <link href="<%: Url.Content("~/Scripts/flexigrid/css/flexigrid.css")%>" rel="stylesheet"
        type="text/css" />
    

    <script type="text/javascript">
        $(document).ready(function () {
        
        
                


            
            $("#fff").flexigrid
			(
			{
			    url: '/Home/List/',
			    dataType: 'json',
			    colModel: [                
				{ display: 'Company', name: 'CompanyName', width: 200, sortable: false, align: 'left' },
				{ display: 'Contact', name: 'ContactName', width: 280, sortable: false, align: 'left' },
				{ display: 'Contact Title', name: 'ContactTitle', width: 220, sortable: false, align: 'left' }
				],
			    buttons: [
				{ name: 'Add', bclass: 'add', onpress: add },
                { name: 'Edit', bclass: 'edit', onpress: edit },
                { name: 'Delete', bclass: 'delete', onpress: del },                                                
				{ separator: true },
                { name: 'A', onpress: sortAlpha },
                { name: 'B', onpress: sortAlpha },
				{ name: 'C', onpress: sortAlpha },
				{ name: 'D', onpress: sortAlpha },
				{ name: 'E', onpress: sortAlpha },
				{ name: 'F', onpress: sortAlpha },
				{ name: 'G', onpress: sortAlpha },
				{ name: 'H', onpress: sortAlpha },
				{ name: 'I', onpress: sortAlpha },
				{ name: 'J', onpress: sortAlpha },
				{ name: 'K', onpress: sortAlpha },
				{ name: 'L', onpress: sortAlpha },
				{ name: 'M', onpress: sortAlpha },
				{ name: 'N', onpress: sortAlpha },
				{ name: 'O', onpress: sortAlpha },
				{ name: 'P', onpress: sortAlpha },
				{ name: 'Q', onpress: sortAlpha },
				{ name: 'R', onpress: sortAlpha },
				{ name: 'S', onpress: sortAlpha },
				{ name: 'T', onpress: sortAlpha },
				{ name: 'U', onpress: sortAlpha },
				{ name: 'V', onpress: sortAlpha },
				{ name: 'W', onpress: sortAlpha },
				{ name: 'X', onpress: sortAlpha },
				{ name: 'Y', onpress: sortAlpha },
				{ name: 'Z', onpress: sortAlpha },
				{ name: 'ALL', onpress: sortAlpha }
				],
			    searchitems: [
				{ display: 'Company', name: 'CompanyName', isdefault: true },
                { display: 'Contact', name: 'ContactName' },
				{ display: 'Contact Title', name: 'ContactTitle' }
				],
                singleSelect: true,
			    sortname: "CompanyName",
			    sortorder: "asc",
			    usepager: true,
			    title: 'Companies',
			    useRp: true,
			    rp: 10,
			    showTableToggleBtn: false,
			    width: 800,
			    height: 255
			}
			);
            

			


        });
        function sortAlpha(com) {
            jQuery('#fff').flexOptions({ newp: 1, params: [{ name: 'letter_pressed', value: com }, { name: 'qtype', value: $('select[name=qtype]').val()}] });
            jQuery("#fff").flexReload();
        }



        function edit(com, grid) {

            // alert(com); // Edit
            
            if ( $('.trSelected',grid).length == 1 ) 
            {
                var items = $('.trSelected',grid);
                alert(com + ' ' + items[0].id.substr(3));
            }
        }


        function add(com, grid) {

            alert(com); 

            /*if ($('.trSelected', grid).length == 1) {
                var items = $('.trSelected', grid);
                alert(items[0].id.substr(3));
            }*/
        }


        function del(com, grid) {

            // alert(com); // Delete

            if ($('.trSelected', grid).length == 1) {
                var items = $('.trSelected', grid);
                alert(com + ' ' + items[0].id.substr(3));
            }
        }
        
    </script>


    <title>Index</title>



</head>
<body>
    <div>
        <table id="fff" style="display:none"></table>
    </div>
</body>




</html>

