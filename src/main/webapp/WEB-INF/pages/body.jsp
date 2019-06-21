<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false" %>
<html>
<head>
	<title>JQuery Datatable + Spring MVC Example</title>
</head>
<body>
	<div style="width: 100%;">
		<header>
			<h1>Spring MVC + JQuery Datatable</h1>
		</header>
		<nav>
			<h4>Employee Names</h4>
			<ul>
			</ul>
			<button style="margin-left: 35%;">Submit</button>
		</nav>
		<article>
			<table id="example" class="display nowrap"  cellspacing="0">
				<thead>
					<tr>
						<th>Name</th>
						<th>Desgination</th>
						<th>Salary</th>
	        			<th>Country</th>
					</tr>
				</thead>
			</table>
		</article>
	</div>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	var data =eval('${employeeList}');
	var table = $('#example').DataTable( {
		  "aaData": data,
		  "aoColumns": [
		    { "mData": "name"},
		    { "mData": "desgination"},
		    { "mData": "salary"},
		    { "mData": "country"} 
		  ],
		  "columnDefs": [	                 
			{		
				"render" : function(data, type, row) {
					return "<a class='empId' value="+data+" href=#>" + data + "</a>";
    			},
				"targets" : 0
			},
		  ],
		  "paging" : true,
		  "pageLength" : 5,
		  "ordering" : true,
		});
		getFilters(table.column(0).data().unique());
	$('a.empID').click(function(e){
	      var employeeInfo = table.row($(this).parents('tr')).data();
	      alert("Employee Details \n\n\n Employee Name is :" + employeeInfo['name'] +"\n Employee Designation is: "+ employeeInfo['desgination'] +" \n Employee Salary is : "+employeeInfo['salary'] );
	   });
	$('button').on('click',function(e){
		if($('input[type="checkbox"]:checked').length<1){
			alert('Select atlease one employee');
		}else{
			var employeeNames = $('input[type="checkbox"]:checked').map(function(){
				return this.value;
			}).get();
			var employeeRegex = "";
			$.each(employeeNames,function(key,value){
				if(key!=employeeNames.length-1){
					employeeRegex+=value+"|";
				}else{
					employeeRegex+=value;
				}
				});
			$('#example').DataTable().search(employeeRegex,true,false).draw();
		}
	});
});

function getFilters(empName){
		$.each(empName,function(key,value){
			$('ul').append('<div class="filters"><li><input class="empName" type="checkbox" value="'+value+'">'+value+'</li></div>');
		});
}	 
</script>