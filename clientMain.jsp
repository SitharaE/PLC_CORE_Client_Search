<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
	.col-form-label{
		text-align: right;
		font-size: 12px;
	}
	fieldset {
	    border: 1px solid;
	    border-color:  #c5c5c5;
	    border-radius: 4px;
	}
	.header-title{
		margin-left: 15px;	
		padding-left: 10px;	
		margin-top: 10px;	
		margin-bottom: 10px;
	}	
	.legendGeneralInfo{
		width: 23%; 
	}

	.legendAddress{
		width: 13%;
	}
	.legendContact{
		width: 18%;
	}

	.profile-bg-picture > .picture-bg-overlay {
		background-image: linear-gradient(to bottom, rgba(255,255,255,0) 0, rgba(0,0,0,0.6) 100%);
	}
	.profile-bg-picture{
		min-height:130px;
	}
	.content-page .content {
		margin-top:50px;
	}
	.dd {
		max-width :auto;
	}
	h4, h5{
		color: #666f7b;
		font-weight: 500;
		line-height: 1.2;
		font-family: "Montserrat",sans-serif;
	}	 
	 #collapseExample{
	 	width: auto;
	 }
	.card-header{
		background-color: #337ab7;	
	}
	.cardHidden{
		width: 100%;
		border: 0;
	}
	
	.modal-dialog {
    	max-width: 80%;
	}	
	.errors-list{
		font-size:12px;
		list-style:none;
		color:#d03f3f;
		margin-top:5px;
		font-weight:600;
		position:relative;
	}
	
	.mdi::before{
		padding-right: 3px;
	}
	.timeline-item.alt h6 {
	    text-align: right;
	}
	
	p {
	    margin-top: 0.3rem;
	    margin-bottom: 0.3rem;	
	}
	.mt-5, .my-5 {
	    margin-top: 0.3rem !important;
	}
.maincard{
	padding-top: 0px;
	padding-bottom: 5px;
	margin-bottom: 0px;
}
.secondcard{
	padding-top: 0px;	
}
.maincardbody{
	padding-top: 10px;
	padding-bottom: 0px;
	margin-bottom: 0px;
}
.secondcardbody{
	padding-top: 10px;
}
.card-body {
    padding-top: 0.75rem;
    padding-bottom: 0.25rem;
}
.tab-content{
	padding-top: 5px;
}
.fa-check-circle {
  color : green;
  background: #FFF;
  border-radius: 70%
}
.fa-times-circle{
  color : red;
  background: #FFF;
  border-radius: 70%
}
.fa-calendar-alt {
  line-height: 1;
}
.pepSection{
  margin-bottom: 0px;
}
.table{
		font-size:12px;
	}
	.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	    padding: 3px 10px;
	}
	.dataTables_length .form-control .form-control-sm {
	    height: calc(1.0rem + 2px);
	}
	.table td{
	 	padding:2px;
	}
	div#tblClientDetails_wrapper {
		width: 100%;
		margin: 0 auto;
		max-height: 50vh;
		min-height: auto;
	}
	.modal-dialog{
	width:500px;
	}
	.switchery-small {
    border-radius: 20px;
    height: 15px;
    width: 40px;
	}

	.switchery-small > small {
    height: 15px;
    width: 20px;
	}
</style> 				

<div class="content-page">
 	<div class="content">
 		<div class="row bg-primary">
        	<div class="col-md-12 col-sm-12">
            	<h5 class="text-white" ><small>Client Search/Create</small></h5>
            </div>
        </div>
        <br>
    	<div class="container-fluid">
    		<div class="row">
    			<c:if test="${not empty ClientDTO}">
    				<c:set var="clientCode" value="${ClientDTO.clientCode}" />
    			</c:if>
    			<!-- UAT Error ID - Sarujan_15 Fixed on 8/5/2023 Sithara -->
    			<div class="col-sm-12 text-right" >  
		            	<div class="col-md-12 right">
							<form:form class="form-horizontal" id='formSearchClient' role="form" method="GET" action="${pageContext.request.contextPath}/public/core/individualClient" >
		                    	<button type="submit" class="btn btn-primary waves-effect waves-light btn-sm"  id='searchExistingClient' name='' onclick="loadProcessing()">
		                        	<i class="fas fa-user"></i> Create Natural Client
		                      	</button>
		                      	<button type="button" class="btn btn-primary waves-effect waves-light btn-sm"  id='searchExistingClient' name='' data-toggle="modal" data-target="#exampleModalCenter">
		                           	<i class="fas fa-users"></i> Create Non Natural Client
		                      	</button>
		                      	<button type="button" class="btn btn-primary waves-effect waves-light btn-sm"  id='payeeApprovalFinance' name='payeeApprovalFinance' onclick="loadProcessing()">
		                           	<i class="fas fa-user-check"></i> Payee Approval Finance
		                      	</button>
		                      	<button type="button" class="btn btn-primary waves-effect waves-light btn-sm"  id='payeeApprovalFDSavings' name='payeeApprovalFDSavings' onclick="loadProcessing()">
		                           	<i class="fas fa-user-check"></i> Payee Approval FD/Savings
		                      	</button>
		         			</form:form>     			
		        		</div>             
    			</div>
   			</div>
		</div>
		<br>
		
        <div class="row">
			<div class="col-md-12 col-sm-12">
           		<div class="card">
               		<div class="card-body">					
						<div class="form-group row" id = "clientSearchBy">
							<div class="col-md-2 col-sm-3">
								<div class="form-radio">
									<label class="form-radio-label"><input class="form-radio-input" type="Radio" name="Client" id="Individual" value="Individual" checked>&nbsp;Natural Client</label>
								</div>
							</div>
							<div class="col-md-2 col-sm-3">
								<div class="form-radio">
									<label class="form-radio-label"><input class="form-radio-input" type="Radio" name="Client" id="Corporate" value="Corporate" >&nbsp;Non Natural Client</label>
								</div>
							</div>
							<div class="col-md-4 col-sm-6">
								<div class="form-radio">
									<!-- <label class="form-radio-label"><input type="checkbox" checked name="pendingClientSearch" class = "switchery switchery-small" id="pendingClientSearch" data-plugin="switchery" data-color="#039cfd" data-size="small"/>&nbsp;Pending Client Approval</label>
									<label class="form-radio-label"><input type="checkbox" name="pendingClientSearch"  id="pendingClientSearch" />&nbsp;Pending Client Approval</label> -->
									<div>
										<label class="switch"><input type="checkbox" name="pendingClientSearch"  id="pendingClientSearch" /><span class="switch-slider round"></span></label>
										<label>Pending Client Approval</label>
									</div>
								</div>
							</div>
							
						</div>
						<div class=" col-md-12" id = "clientSearch1"> 
							<div class="form-group row" >
								<label class="col-2 col-form-label text-right">NIC/BC/Passport&nbsp&nbsp<span class="text-danger">*</span></label>
								<div class="col-3">
									<input type="text" maxlength="12" id="txtCSNIc" name="txtCSNIc" class="form-control form-control-sm" autofocus="autofocus" maxlength="12" value="" >
									<errors cssClass="errors-list  mdi mdi-close-circle" >  </errors>
									<span id="divErrSearchClientNIC" class="errors-list" ></span>
									<span id="clientNICError2" class="errors-list" ></span>
								</div>	
								<label class="col-2 col-form-label text-right">Client Code &nbsp&nbsp<span class="text-danger">*</span></label>
								<div class="col-md-3">
									<input type="text" maxlength="8" id="txtCSClientCode" name="txtCSClientCode" class="form-control form-control-sm" value="">
									<errors cssClass="errors-list  mdi mdi-close-circle" >  </errors>
									<span id="divErrSearchClientCode" class="errors-list" ></span>
									<span id="clientCodeError2" class="errors-list" ></span>
								</div>
							</div>
							<div class="form-group row">				
								<label class="col-md-2 col-sm-4 col-form-label text-right">Last Name&nbsp&nbsp<span class="text-danger" >*</span></label>
								<div class="col-3">
									<input type="text" id="txtCSSurname" name="txtCSSurname" class="form-control form-control-sm alphabetsOnly">
									<span id="divErrSearchClientSurname" class="errors-list" ></span>
								</div>								
								<label class="col-md-2 col-form-label text-right">Initials</label>
								<div class="col-md-3">
									<input type="text" id="txtCSInitials" name="txtCSInitials" class="form-control form-control-sm alphabetsOnly">
								</div>
								<div class="col-md-2 text-left">
									<button type="button" class="btn btn-info btn-sm" id="btnClientSearch">Search <i class="fas fa-search"></i></button>
									<!--clear button2  -->
									<button type="button" class="btn btn-danger btn-sm" onclick="clearButton()" id="btnCorClientClear">Clear <i class="fas fa-window-close" ></i></button>
								</div>				
							</div>
							<div class="form-group row">				
								<label class="col-md-2 col-sm-4 col-form-label text-right">Town&nbsp&nbsp</label>
								<div class="col-3">
									<input type="text" id="txtCSTown" name="txtCSTown" class="form-control form-control-sm" autofocus="autofocus">
									<span id="divErrSearchTown" class="errors-list" ></span>
								</div>																				
							</div>
						</div>
						 
						<div class=" col-md-12" id = "corClientSearch1"> 
							<div class="form-group row" >
								<label class="col-2 col-form-label text-right">BR No&nbsp&nbsp<span class="text-danger">*</span></label>
								<div class="col-3">
									<input type="text" id="txtCSBRNo" name="txtCSBRNo" class="form-control form-control-sm" value="" >
									<errors cssClass="errors-list  mdi mdi-close-circle" >  </errors>
									<span id="divErrSearchBRNo" class="errors-list" ></span>
									<span id="brNoError2" class="errors-list" ></span>
									
								</div>	
								<label class="col-2 col-form-label text-right">Client Code&nbsp&nbsp<span class="text-danger">*</span></label>
								<div class="col-md-3">
									<input type="text" maxlength="8" id="txtCSCorClientCode" name="txtCSCorClientCode" class="form-control form-control-sm" value="">
									<errors cssClass="errors-list  mdi mdi-close-circle" >  </errors>
									<span id="divErrSearchCorClientCode" class="errors-list" ></span>
									<span id="corClientError2" class="errors-list" ></span>
								</div>
							</div>
							<div class="form-group row">				
								<label class="col-md-2 col-sm-4 col-form-label text-right">Business Name&nbsp&nbsp<span class="text-danger">*</span></label>
								<div class="col-3">
									<input type="text" id="txtCSBusinessName" name="txtCSBusinessName" class="form-control form-control-sm" autofocus="autofocus">
									<span id="divErrSearchBusinessName" class="errors-list" ></span>
								</div>
								<label class="col-md-2 col-sm-4 col-form-label text-right">Town&nbsp&nbsp</label>
								<div class="col-3">
									<input type="text" id="txtCSCorTown" name="txtCSCorTown" class="form-control form-control-sm" autofocus="autofocus">
									<span id="divErrSearchCorTown" class="errors-list" ></span>
								</div>
								<div class="col-md-2 text-left">
									<button type="button" class="btn btn-info btn-sm" id="btnCorClientSearch">Search <i class="fas fa-search"></i></button>
									<!--clear button2  -->
									<button type="button" class="btn btn-danger btn-sm" onclick="clearButton()" id="btnCorClientClear">Clear <i class="fas fa-window-close" ></i></button>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		
        <div class="row" >
			<div class="col-md-12 col-sm-12" id = "clientSearch2">
           		<div class="card">
					<div class="card-body" >				
						<div class="form-group row" id="divClientDetails">
						<i class="fas fa-user"></i><h5>Main Client Details</h5>
							<div class="table-responsive">
							<table id="tblClientDetails" class="table table-striped table-bordered display compact table-hover nowrap" style="width: 100% ; cellspacing:0">
								<thead class="thead-dark">
									<tr class="bg-inverse text-white">
										<th>Client Code</th>
										<th>NIC No</th>
										<th>Client Name</th>
										<th hidden="true">Initials</th>
										<th hidden="true">Address 1</th>
										<th hidden="true">Address 2</th>
										<th hidden="true">Address 3</th>
										<th hidden="true">Address 4</th>
										<th hidden="true">Initials</th>
										<th hidden="true">Address 1</th>
										<th hidden="true">Initials</th>
										<th hidden="true">Address 1</th>
										<th hidden="true">Address 2</th>
										<th hidden="true">Address 3</th>
										<th hidden="true">Address 4</th>
										<th >Action</th>
										<th hidden="true">Version</th>
										<th hidden="true">Age</th>
										<th hidden="true">Mobile</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>		
						</div>
					</div>
				</div>
			</div>
       	</div>
       	
       	<div class="row" >
			<div class="col-md-12 col-sm-12" id = "corClientSearch2">
           		<div class="card">
					<div class="card-body" >				
						<div class="form-group row" id="divCorClientDetails">
						<i class="fas fa-user"></i><h5>Main Client Details</h5>
							<div class="table-responsive">
							<table id="tblCorClientDetails" class="table table-striped table-bordered display compact table-hover nowrap" cellspacing="0" width="100%">
								<thead class="thead-dark">
									<tr class="data-in-table">
										<th>Client Code</th>
										<th>BR No</th>
										<th>Business Name</th>
										<th hidden="true">Initials</th>
										<th hidden="true">Address 1</th>
										<th hidden="true">Address 2</th>
										<th hidden="true">Address 3</th>
										<th hidden="true">Address 4</th>
										<th hidden="true">Initials</th>
										<th hidden="true">Address 1</th>
										<th hidden="true">Initials</th>
										<th hidden="true">Address 1</th>
										<th hidden="true">Address 2</th>
										<th hidden="true">Address 3</th>
										<th hidden="true">Address 4</th>
										<th >Action</th>
										<th hidden="true">Version</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>		
						</div>
					</div>
				</div>
			</div>
       	</div> 
       	
       	<div class=" col-md-12" id = "clStsMsg">
			<div class="col-md-7">
				<h6 id="clientStatusMsg"></h6>
			</div>
		</div>
       	
        <div class="row">
			<div class="col-md-12 col-sm-12" id = "clientSearch3">
           		<div class="card">
					<div class="card-body" >
						<div class="col-md-12 col-sm-12">					
							<div class="row">
								<div class="col-md-3 col-sm-12 tbCls">
									<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/resources/velonic/admin/assets/images/users/sample-profile.png" width="200" height="200"/>
								</div>
								<div class="col-md-9 col-sm-12 tbCls"> 
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Full Name</label>
										<div class="col-9">
											<input class="form-control form-control-sm" name="clientFullName" id="clientFullName" disabled="disabled">
									    </div>
								</div>
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Age(Years)</label>
										<div class="col-3">
											<input class="form-control form-control-sm" name="clientAge" id="clientAge" disabled="disabled">
									    </div>
								</div>
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Permanent Address</label>
										<div class="col-9">
											<input class="form-control form-control-sm" name="clientAddress" id="clientAddress" disabled="disabled">
									    </div>
								</div>
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Home Telephone</label>
										<div class="col-3">
											<input class="form-control form-control-sm" name="clientHomeTP" id="clientHomeTP" disabled="disabled">
									    </div>
								</div>
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Primary Mobile</label>
										<div class="col-3">
											<input class="form-control form-control-sm" name="clientMobileNo" id="clientMobileNo" disabled="disabled">
									    </div>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
       	</div>
    </div>		
    
    <div class="row">
			<div class="col-md-12 col-sm-12" id = "corClientSearch3">
           		<div class="card">
					<div class="card-body" >
						<div class="col-md-12 col-sm-12">					
							<div class="row">
								<div class="col-md-3 col-sm-12 tbCls">
									<img src="${pageContext.request.contextPath}/resources/velonic/admin/assets/images/users/images.jfif" class="rounded" width="150" height="150"/>
								</div>
								<div class="col-md-9 col-sm-12 tbCls"> 
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Business Name</label>
										<div class="col-9">
											<input class="form-control form-control-sm" name="businessName" id="businessName" disabled="disabled">
									    </div>
								</div>
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Registered Address</label>
										<div class="col-9">
											<input class="form-control form-control-sm" name="registeredAddress" id="registeredAddress" disabled="disabled">
									    </div>
								</div>
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Business Contact No</label>
										<div class="col-3">
											<input class="form-control form-control-sm" name="businessTP" id="businessTP" disabled="disabled">
									    </div>
								</div>
								<div class="form-group row"> 
									<label class="control-label col-md-3 col-sm-3 text-right" >Nature of Business</label>
										<div class="col-9">
											<input class="form-control form-control-sm" name="businessNature" id="businessNature" disabled="disabled">
									    </div>
								</div>								  
							</div>
						</div>
					</div>
				</div>
			</div>
       	</div>
    </div>
    <div class="row">
			<div class="col-md-12 col-sm-12" id = "groupClient">
           		<div class="card">
					<div class="card-body" >				
						<div class="form-group row" id="divgroupClient">
						<i class="fas fa-users"></i><h5>Group Client Details</h5>
							<div class="table-responsive">
							<table id="tblGroupClientDetails" class="table table-striped table-bordered display compact table-hover nowrap" cellspacing="0" width="100%">
								<thead class="thead-dark">
									<tr class="data-in-table">
										<th hidden="true">Main Client Code</th>
										<th>Group Client Code</th>
										<th>Group Client ID/BR No.</th>
										<th>Group Client Name</th>
										<th>Relationship Type</th>
										<th hidden="true">Relationship Code</th>
										<th hidden="true">Version</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>		
						</div>
					</div>
				</div>
			</div>
    </div>
    <input type="hidden" name="hdnClientCode" id="hdnClientCode">
	<input type="hidden" name="hdnVersion" id="hdnVersion">
	<input type="hidden" name="hidParam1" id="hidParam1" value="I">
</div>
</div>

<!-- Pop Up Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Select Non Natural Client Type</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row">
      <div class="col-sm-6 mx-auto d-block">
      <form:form class="form-horizontal" id='formSearchClient' role="form" method="POST" action="${pageContext.request.contextPath}/public/core/corporateClient?nonNaturalCusType=PRO" >
		<button type="submit" class="btn bg-warning text-white font-weight-bold waves-effect waves-light btn-md btn-block mb-2"  id='btnSoleProprietor' name='' data-toggle="modal" title="Sole Proprietor" data-target="#exampleModalCenter" onclick="loadProcessing()">
		 <i class="fas fa-user-friends"></i>&nbsp Sole Proprietor
		</button>
		</form:form>
	  </div>
	        <div class="col-sm-6 mx-auto d-block">
	        <form:form class="form-horizontal" id='formSearchClient' role="form" method="POST" action="${pageContext.request.contextPath}/public/core/corporateClient?nonNaturalCusType=PRT" >   
		<button type="submit" class="btn bg-danger text-white font-weight-bold waves-effect waves-light btn-md btn-block"  id='btnPartnership' name='' data-toggle="modal" title="Partnership" data-target="#exampleModalCenter" onclick="loadProcessing()">
		 <i class="fas fa-user-friends"></i>&nbsp Partnership
		</button>
		</form:form>
	  </div>
	  	        <div class="col-sm-6 mx-auto d-block">
	  	         <form:form class="form-horizontal" id='formSearchClient' role="form" method="POST" action="${pageContext.request.contextPath}/public/core/corporateClient?nonNaturalCusType=SOC" > 
		<button type="submit" class="btn bg-secondary text-white font-weight-bold waves-effect waves-light btn-md btn-block"  id='btnSociety' name='' data-toggle="modal" title="Co-Operative Institutes,Corporations/Authorities/Statutory Body,Non Government Organization,Society" data-target="#exampleModalCenter" onclick="loadProcessing()">
		 <i class="fas fa-user-friends"></i>&nbsp Other Entities
		</button>
		</form:form>
	  </div>
	  	        <div class="col-sm-6 mx-auto d-block">
	  	         <form:form class="form-horizontal" id='formSearchClient' role="form" method="POST" action="${pageContext.request.contextPath}/public/core/corporateClient?nonNaturalCusType=PRL" > 
		<button type="submit" class="btn bg-info text-white font-weight-bold waves-effect waves-light btn-md btn-block"  id='btnPrivate' name='' data-toggle="modal" title="Private Limited,Private Limited by Gurantee,Public Limited,Public Limited by Gurantee" data-target="#exampleModalCenter" onclick="loadProcessing()">
		 <i class="fas fa-user-friends"></i>&nbsp Company
		</button>
		</form:form>
	  </div>	  
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>
<!--End  Modal -->
<spring:eval expression="@environment.getProperty('clentSearch.url')" var="frontendUrl" />
<input type="hidden" id="helpUrl" name="helpUrl" value="${frontendUrl}" /> 

<jsp:include page="../credit/creditFooter.jsp" /> 
<div id="divSearchPopup"></div>
<script>
$(document).ready(function(){	
	loadProcessing(); 
	$('[data-toggle="tooltip"]').tooltip();
	
	var tblClientDetails = $('#tblClientDetails').DataTable( {
    	"pageLength": 5
    });
	
	var tblCorClientDetails = $('#tblCorClientDetails').DataTable( {
    	"pageLength": 5
    });
	
	var tblGroupClientDetails = $('#tblGroupClientDetails').DataTable( {
    	"pageLength": 5
    });
	
	tblGroupClientDetails = $('#tblGroupClientDetails').dataTable({
		"bJQueryUI": false,
        "bInfo": false,
		"bProcessing" : true,
		"bDestroy": true,
		"sServerMethod" : "POST",
    	//"bScrollCollapse": true,
    	//"scrollX" : false,
    	"bFilter": false,
		//"sScrollY" : "170px",
    	//"pageLength": 5,
	   	"columnDefs": [
	   	      { "targets": 0,"visible": false},
	   	      { "targets": 1 },
	   	      { "targets": 2 },
	   	      { "targets": 3 },
	   	   	  { "targets": 4 },
	    	  { "targets": 5 ,"visible": false },
	    	  { "targets": 6 ,"visible": false }
		],
		"sAjaxSource": document.getElementById('contextPath').value + '/public/core/getExistingGroupClients'+ "?rid=" + new Date().getTime(),
		"fnServerParams": function (aoData) {
           	aoData.push(
         	{ name: "clientCode", value: $('#hdnClientCode').val() });
		},
		"aoColumns": [
			{"mDataProp": "mainClientCode", "bSortable": true},
			{"mDataProp": "groupClientCode", "bSortable": true},
			{"mDataProp": "groupClientNICNo", "bSortable": true},
			{"mDataProp": "groupClientName", "bSortable": true},
			{"mDataProp": "groupClientRelationshipDesc","sDefaultContent": "", "bSortable": true},
			{"mDataProp": "groupClientRelationshipCode", "bSortable": false},
			{"mDataProp": "recordVersion", "bSortable": true}
		],
		"fnServerData": function ( sSource, aoData, fnCallback ) {
        	$.ajax( {
        	"dataType": 'json',
        	"type": "POST",
        	"url": sSource,
        	"data": aoData,
        	"success": fnCallback,
        	"error": handleDataTableAjaxError // this sets up jQuery to give me errors
        	} );
        },
		"fnRowCallback": function (nRow, aData, iDisplayIndex) {
			if($('#hdnIsViewFlag').val()=='0'){	
				$('td:eq(4)', nRow).html('<a class="on-default remove-row" href="#" id="actionDelete"><i class="far fa-trash-alt table_delete_icon"></i></a>');
			}else{
				$('td:eq(4)', nRow).html('');
			}	
		},
		"fnDrawCallback": function(oSettings) {
			 $("#tblGroupClientDetails tbody tr").click( function() {
				var data = tblGroupClientDetails.fnGetData( this );
				tblGroupClientDetails.$('tr.row_selected').removeClass('row_selected');
				$(this).addClass('row_selected');     
		    });
		}, 
		"bAutoWidth": false
	});
	
	//toUpperCase
	$("#txtCSNIc, #txtCSClientCode, #txtCSSurname, #txtCSInitials, #txtCSTown, #txtCSBRNo, #txtCSCorClientCode, #txtCSBusinessName, #txtCSCorTown ").keyup(function(){
	  $(this).val( $(this).val().toUpperCase() );
	});
	
	/* Mantis Error ID - 0000024 */
	$("#txtCSNIc, #txtCSClientCode, #txtCSBRNo, #txtCSCorClientCode").bind("keyup",function(){
		
		var divErrSearchClientNIC, divErrSearchClientCode, divErrSearchBRNo, divErrSearchCorClientCode = false;
		
		//validation remove since here we search not only NIC, but also Passport & BC(Agree with QA Hasini)
		/* var clientNICVal = $("#txtCSNIc").val();
		if(clientNICVal != ''){    	    	
			if (validateNIC(clientNICVal)) {    				
				divErrSearchClientNIC=false;
				$("#clientNICError2").html("");
		        $("#clientNICError2").removeClass("errors-list mdi mdi-close-circle");
			}else{    			
				divErrSearchClientNIC=true;
				$("#clientNICError2").html("Invalid NIC Format.");
		        $("#clientNICError2").addClass("errors-list mdi mdi-close-circle");
			}
		}else{
				divErrSearchClientNIC=false;
				$("#clientNICError2").html("");
	        	$("#clientNICError2").removeClass("errors-list mdi mdi-close-circle");
		} */
		
		var clientCodeRegexFilter = /^([I]{1}[A-Z]{1}[0-9]{6}|[I]{1}[0-9]{7})$/;
		var ClientCodeVal = $("#txtCSClientCode").val();
		if(ClientCodeVal != ''){    	    	
			if (clientCodeRegexFilter.test(ClientCodeVal)) {    				
				divErrSearchClientCode=false;
				$("#clientCodeError2").html("");
		        $("#clientCodeError2").removeClass("errors-list mdi mdi-close-circle");
			}else{    			
				divErrSearchClientCode=true;
				$("#clientCodeError2").html("Invalid Client Code");
		        $("#clientCodeError2").addClass("errors-list mdi mdi-close-circle");
			}
		}else{
			divErrSearchClientCode=false;
				$("#clientCodeError2").html("");
	        	$("#clientCodeError2").removeClass("errors-list mdi mdi-close-circle");
		}
		
		var corClientCodeRegexFilter = /^([C]{1}[0-9]{7}|[C]{1}[A-Z]{1}[0-9]{6})$/;
		var corClientCodeVal = $("#txtCSCorClientCode").val();
		if(corClientCodeVal != ''){    	    	
			if (corClientCodeRegexFilter.test(corClientCodeVal)) {    				
				divErrSearchCorClientCode=false;
				$("#corClientError2").html("");
		        $("#corClientError2").removeClass("errors-list mdi mdi-close-circle");
			}else{    			
				divErrSearchCorClientCode=true;
				$("#corClientError2").html("Invalid Corporate Client Code");
		        $("#corClientError2").addClass("errors-list mdi mdi-close-circle");
			}
		}else{
			divErrSearchCorClientCode=false;
				$("#corClientError2").html("");
	        	$("#corClientError2").removeClass("errors-list mdi mdi-close-circle");
		}
		
	});

	
	$('#btnClientSearch').click(function(){
		
		$('#clientFullName, #clientAge, #clientAddress, #clientHomeTP, #clientMobileNo').val("");
		
		 if($("#hidParam1").val() == "I") {
			var nic        = $('#txtCSNIc').val().replace(/\s/g, '');
			var clientCode = $('#txtCSClientCode').val().replace(/\s/g, '');
			var surName    = $('#txtCSSurname').val().replace(/\s/g, '');
			var initials   = $('#txtCSInitials').val().replace(/\s/g, '');
			var town  	   = $('#txtCSTown').val().replace(/\s/g, '');
			var clientType = "I";
			var pendingClientSearch = $('#pendingClientSearch').is(':checked');
		
			$('#clientFullName,#clientAge,#clientAddress,#clientHomeTP,#clientMobileNo').html('');
			if(nic!="" || clientCode!="" || surName!=""){
				$('#divErrSearchClientNIC,#divErrSearchClientCode,#divErrSearchClientSurname').html('');
				$('#divErrSearchClientNIC,#divErrSearchClientCode,#divErrSearchClientSurname').removeClass("errors-list mdi mdi-close-circle");
				tblClientDetails = $('#tblClientDetails').dataTable({
		    		"bJQueryUI": false,
		            "bInfo": false,
		    		"bProcessing" : true,
		    		"bDestroy": true,
		    		"sServerMethod" : "POST",
		        	//"bScrollCollapse": true,
		        	//"scrollX" : false,
		        	"bFilter": false,
		        	"searching": true,
					//"sScrollY" : "170px",
			    	"pageLength": 5,
			    	"columnDefs": [ 
			    		  { "targets": 0 },
			    	      { "targets": 1 },
			    	      { "targets": 2 },
			    	      { "targets": 3 ,"visible": false},
			    	      { "targets": 4 ,"visible": false},
			    	      { "targets": 5 ,"visible": false},
			    	      { "targets": 6 ,"visible": false},
			    	      { "targets": 7 ,"visible": false},
			    	      { "targets": 8 , "visible": false},
			    	      { "targets": 9 , "visible": false},
			    	      { "targets": 10 , "visible": false},
			    	      { "targets": 11 , "visible": false},
			    	      { "targets": 12 , "visible": false},
			    	      { "targets": 13 , "visible": false},
			    	      { "targets": 14 , "visible": false},
				    	  { "targets": 15 , "searchable": false},
				    	  { "targets": 16 , "visible": false},
				    	  { "targets": 17 , "visible": false},
				    	  { "targets": 18 , "visible": false}
			    	    ],
		    		"sAjaxSource": document.getElementById('contextPath').value + '/public/core/clientDetailsForClientMain'+ "?rid=" + new Date().getTime(),
		    		"sPaginationType" : "full_numbers",
		            "fnServerParams": function (aoData) {
			            aoData.push(
			            	{ name: "nic", value: nic},
			            	{ name: "code", value: clientCode},
			                { name: "surName", value: surName},
			                { name: "initials", value: initials},
			                { name: "town", value: town},
			                { name: "clientType", value: clientType},
			                { name: "pendingClientSearch", value: pendingClientSearch}
			            );
			        },
			        "fnServerData": function ( sSource, aoData, fnCallback ) {
			        	$.ajax( {
			        	"dataType": 'json',
			        	"type": "POST",
			        	"url": sSource,
			        	"data": aoData,
			        	"success": fnCallback,
			        	"error": handleDataTableAjaxError // this sets up jQuery to give me errors
			        	} );
			        },
		            "aoColumns": [
		                {"mDataProp": "clientCode","sDefaultContent": "", "bSortable": true},
		                {"mDataProp": "idNo","sDefaultContent": "", "bSortable": true},
		                {"mDataProp": "clientFullName","sDefaultContent": "", "bSortable": true},
		                {"mDataProp": "clientInitials","sDefaultContent": "", "bSortable": true},
		                {"mDataProp": "clientAddress1","sDefaultContent": "", "bSortable": true},
		                {"mDataProp": "clientAddress2","sDefaultContent": "", "bSortable": true},
		                {"mDataProp": "clientAddress3","sDefaultContent": "", "bSortable": true},
		                {"mDataProp": "clientAddress4","sDefaultContent": "","bSortable": true},
		                {"mDataProp": "businessRegistrationNO","sDefaultContent": "","bSortable": true},
		                {"mDataProp": "gstNo","sDefaultContent": "","bSortable": true},
		                {"mDataProp": "contactPersonDesignation","bSortable": true},
		                {"mDataProp": "introducer","sDefaultContent": "","bSortable": true},
		                {"mDataProp": "contactPerson","sDefaultContent": "","bSortable": true},
		                {"mDataProp": "telephoneNo","sDefaultContent": "","bSortable": true},
		                {"mDataProp": "faxNo","sDefaultContent": "","bSortable": true},
		                {"mDataProp": "null","sDefaultContent": "", "bSortable": false,"sClass": "text-center"},
		                {"mDataProp": "recordVersion","sDefaultContent": "","bSortable": false},
		                {"mDataProp": "age","sDefaultContent": "","bSortable": false},
		                {"mDataProp": "mobile","sDefaultContent": "","bSortable": false},
		            ],
		            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
		            	var url ='';
		            	var view ='';
		            	if(aData.clientType=="C"){
		            		url="getCorporateClientDetails?clientCode="+aData.clientCode+"&isViewFlag=0";
		            		view="getCorporateClientDetails?clientCode="+aData.clientCode+"&isViewFlag=1";
		    			}else if(aData.clientType=="I"){
		            		url="getIndividualClientDetails?clientCode="+aData.clientCode+"&isViewFlag=0";
		            		view="getIndividualClientDetails?clientCode="+aData.clientCode+"&isViewFlag=1";
		    			}
		            	$('td:eq(3)', nRow).html('&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="on-default edit-row" href="'+view+'" id="actionView" data-toggle="tooltip" title="View" onclick="loadProcessing()"><i class="fas fa-info-circle table_edit_icon"></i></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="on-default edit-row" href="'+url+'" id="actionEdit" data-toggle="tooltip" title="Edit" onclick="loadProcessing()"><i class="fas fa-pencil-alt table_edit_icon"></i></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="on-default remove-row" href="#" onclick="deleteConfirmation(this)" id="actionDelete"><i class="far fa-trash-alt table_delete_icon" data-toggle="tooltip" title="Delete"></i></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp');
		           }, 
		           "fnDrawCallback": function(oSettings) {
		    		 	$("#tblClientDetails tbody tr").click( function() {
		    		 		var data = tblClientDetails.fnGetData( this );	    		 		
	    		        	tblClientDetails.$('tr.row_selected').removeClass('row_selected');
	    		            $(this).addClass('row_selected');    		            
	    		            $("#clientFullName").val(data.clientCode + ' - ' +  data.fullName);
	    		            $('#clientAge').val(data.age);
	    		            $("#clientAddress").val(data.clientAddress1 + ' ' +  data.clientAddress2 + ' ' +  data.clientAddress3 + ' ' +  data.clientAddress4); 
	    		            $('#clientHomeTP').val(data.telephoneNo); 
	    		            $('#clientMobileNo').val(data.mobile); 
	    					//$('#divClientBasicInfor').show();
	    					$('#hdnClientCode').val(data.clientCode); 
	     		            $('#hdnVersion').val(data.recordVersion);      		            
	     		            $("#clientSearch3").show();
	     		            $("#clStsMsg").show();
	     		            $("#tblGroupClientDetails tbody > tr").remove();
	     		           	$('#tblGroupClientDetails').DataTable().ajax.reload();
	     		           
	     		         	//client status view on screen 
	     		         	var clientStatusCode = data.clientStatusCode;
    						var clientStatusDesc = data.clientStatusDesc; 
    						//alert(clientStatusCode);       						
		     		       if(clientStatusCode == "P"){ 
			     		       //alert("P");   			
		     					$("#clientStatusMsg").html(clientStatusDesc);
		     					$("#clientStatusMsg").removeClass("text-success");
		     			        $("#clientStatusMsg").addClass("text-danger");
		     	    		}else if (clientStatusCode == "R"){
		     	    			//alert("R");   
		     	    			$("#clientStatusMsg").html(clientStatusDesc);
		     	    			$("#clientStatusMsg").removeClass("text-success");
		     			        $("#clientStatusMsg").addClass("text-danger");
		     	    		}else if (clientStatusCode == "A"){
		     	    			//alert("A");   
		     	    			$("#clientStatusMsg").html(clientStatusDesc);
		     	    			$("#clientStatusMsg").removeClass("text-danger");
		     			        $("#clientStatusMsg").addClass("text-success");
		     	    		}
	     		            
		    		    });
		    	     },
					"bAutoWidth": false
		    	});
			}else{
				$('#tblClientDetails').dataTable().fnClearTable();
		        $("#divErrSearchClientSurname,#divErrSearchClientCode,#divErrSearchClientNIC").html("One is required.");
		        $("#divErrSearchClientSurname,#divErrSearchClientCode,#divErrSearchClientNIC").addClass("errors-list mdi mdi-close-circle");
			}
		 }
	});
		 
		 $('#btnCorClientSearch').click(function(){
			 
			 $('#businessName, #registeredAddress, #businessTP, #businessNature').val("");
				
				if($("#hidParam1").val() == "C") { 
				var nic        = $('#txtCSBRNo').val().replace(/\s/g, '');
				var clientCode = $('#txtCSCorClientCode').val().replace(/\s/g, '');
				var surName    = $('#txtCSBusinessName').val();
				var initials   = "";
				var town  	   = $('#txtCSCorTown').val().replace(/\s/g, '');
				var clientType = "C";
				var pendingClientSearch = $('#pendingClientSearch').is(':checked');
				
				$('#businessName,#registeredAddress,#businessTP,#businessNature').html('');
				if( (nic != "") || (clientCode != "") || (surName != "")){
					
					$('#divErrSearchBRNo,#divErrSearchCorClientCode,#divErrSearchBusinessName,#divErrSearchCorTown').html('');
					$('#divErrSearchBRNo,#divErrSearchCorClientCode,#divErrSearchBusinessName,#divErrSearchCorTown').removeClass("errors-list mdi mdi-close-circle");
					tblCorClientDetails = $('#tblCorClientDetails').dataTable({
						"bJQueryUI": false,
			            "bInfo": false,
			    		"bProcessing" : true,
			    		"bDestroy": true,
			    		"sServerMethod" : "POST",
			        	//"bScrollCollapse": true,
			        	//"scrollX" : false,
			        	"bFilter": false,
			        	"searching": true,
						//"sScrollY" : "170px",
				    	"pageLength": 5,
				    	"columnDefs": [ 
				    		  { "targets": 0 },
				    	      { "targets": 1 },
				    	      { "targets": 2 },
				    	      { "targets": 3 ,"visible": false},
				    	      { "targets": 4 ,"visible": false},
				    	      { "targets": 5 ,"visible": false},
				    	      { "targets": 6 ,"visible": false},
				    	      { "targets": 7 ,"visible": false},
				    	      { "targets": 8 , "visible": false},
				    	      { "targets": 9 , "visible": false},
				    	      { "targets": 10 , "visible": false},
				    	      { "targets": 11 , "visible": false},
				    	      { "targets": 12 , "visible": false},
				    	      { "targets": 13 , "visible": false},
				    	      { "targets": 14 , "visible": false},
					    	  { "targets": 15 , "searchable": false},
					    	  { "targets": 16 , "visible": false},
					    	  { "targets": 17 , "visible": false},
					    	  { "targets": 18 , "visible": false}
				    	    ],
			    		"sAjaxSource": document.getElementById('contextPath').value + '/public/core/clientDetailsForClientMain'+ "?rid=" + new Date().getTime(),
			    		"sPaginationType" : "full_numbers",
			            "fnServerParams": function (aoData) {
				            aoData.push(
				            	{ name: "nic", value: nic},
				            	{ name: "code", value: clientCode},
				                { name: "surName", value: surName},
				                { name: "initials", value: initials },
				                { name: "town", value: town},
				                { name: "clientType", value: clientType},
				                { name: "pendingClientSearch", value: pendingClientSearch}
				            );
				        },
			            "aoColumns": [
			                {"mDataProp": "clientCode","sDefaultContent": "", "bSortable": true},
			                {"mDataProp": "idNo","sDefaultContent": "", "bSortable": true},
			                {"mDataProp": "clientFullName","sDefaultContent": "", "bSortable": true},
			                {"mDataProp": "clientInitials","sDefaultContent": "", "bSortable": true},
			                {"mDataProp": "clientAddress1","sDefaultContent": "", "bSortable": true},
			                {"mDataProp": "clientAddress2","sDefaultContent": "", "bSortable": true},
			                {"mDataProp": "clientAddress3","sDefaultContent": "", "bSortable": true},
			                {"mDataProp": "clientAddress4","sDefaultContent": "","bSortable": true},
			                {"mDataProp": "businessRegistrationNO","sDefaultContent": "","bSortable": true},
			                {"mDataProp": "gstNo","sDefaultContent": "","bSortable": true},
			                {"mDataProp": "contactPersonDesignation","bSortable": true},
			                {"mDataProp": "introducer","sDefaultContent": "","bSortable": true},
			                {"mDataProp": "contactPerson","sDefaultContent": "","bSortable": true},
			                {"mDataProp": "telephoneNo","sDefaultContent": "","bSortable": true},
			                {"mDataProp": "faxNo","sDefaultContent": "","bSortable": true},
			                {"mDataProp": "null","sDefaultContent": "", "bSortable": false,"sClass": "text-center"},
			                {"mDataProp": "recordVersion","sDefaultContent": "","bSortable": false},
			                {"mDataProp": "age","sDefaultContent": "","bSortable": false},
			                {"mDataProp": "mobile","sDefaultContent": "","bSortable": false},
			            ],
			            "fnServerData": function ( sSource, aoData, fnCallback ) {
				        	$.ajax( {
				        	"dataType": 'json',
				        	"type": "POST",
				        	"url": sSource,
				        	"data": aoData,
				        	"success": fnCallback,
				        	"error": handleDataTableAjaxError // this sets up jQuery to give me errors
				        	} );
				        },
			            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
			            	var url ='';
			            	var view ='';
			            	if(aData.clientType=="C"){
			            		url="getCorporateClientDetails?clientCode="+aData.clientCode+"&isViewFlag=0";
			            		view="getCorporateClientDetails?clientCode="+aData.clientCode+"&isViewFlag=1";
			    			}else if(aData.clientType=="I"){
			            		url="getIndividualClientDetails?clientCode="+aData.clientCode+"&isViewFlag=0";
			            		view="getIndividualClientDetails?clientCode="+aData.clientCode+"&isViewFlag=1";
			    			}
			            	$('td:eq(3)', nRow).html('&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="on-default edit-row" href="'+view+'" id="actionView" data-toggle="tooltip" title="View" onclick="loadProcessing()"><i class="fas fa-info-circle table_edit_icon"></i></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="on-default edit-row" href="'+url+'" id="actionEdit" data-toggle="tooltip" title="Edit" onclick="loadProcessing()"><i class="fas fa-pencil-alt table_edit_icon"></i></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="on-default remove-row" href="#" onclick="deleteConfirmation(this)" id="actionDelete"><i class="far fa-trash-alt table_delete_icon" data-toggle="tooltip" title="Delete"></i></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp');
			           }, 
			           "fnDrawCallback": function(oSettings) {
			    		 	$("#tblCorClientDetails tbody tr").click( function() {
			    		 		var data = tblCorClientDetails.fnGetData( this );	    		 		
			    		 		tblCorClientDetails.$('tr.row_selected').removeClass('row_selected');
		    		            $(this).addClass('row_selected');		    		            
		    		            $("#businessName").val(data.clientCode + ' - ' +  data.clientFullName);
		    		            $("#registeredAddress").val(data.clientAddress1 + ' ' +  data.clientAddress2 + ' ' +  data.clientAddress3 + ' ' +  data.clientAddress4); 
		    		            $('#businessTP').val(data.telephoneNo); 
		    		            $('#businessNature').val(data.natureOfBusiness); 
		    					//$('#divClientBasicInfor').show();
		    					$('#hdnClientCode').val(data.clientCode); 
		     		            $('#hdnVersion').val(data.recordVersion);      		            
		     		            $("#corClientSearch3").show();
		     		           	$("#clStsMsg").show();
		     		            $("#tblGroupClientDetails tbody > tr").remove();
		     		            $('#tblGroupClientDetails').DataTable().ajax.reload();
		     		            
		     		         	//client status view on screen 
		     		         	var clientStatusCode = data.clientStatusCode;
        						var clientStatusDesc = data.clientStatusDesc; 
        						//alert(clientStatusCode);       						
			     		       if(clientStatusCode == "P"){ 
				     		       //alert("P");   			
			     					$("#clientStatusMsg").html(clientStatusDesc);
			     					$("#clientStatusMsg").removeClass("text-success");
			     			        $("#clientStatusMsg").addClass("text-danger");
			     	    		}else if (clientStatusCode == "R"){
			     	    			//alert("R");   
			     	    			$("#clientStatusMsg").html(clientStatusDesc);
			     	    			$("#clientStatusMsg").removeClass("text-success");
			     			        $("#clientStatusMsg").addClass("text-danger");
			     	    		}else if (clientStatusCode == "A"){
			     	    			//alert("A");   
			     	    			$("#clientStatusMsg").html(clientStatusDesc);
			     	    			$("#clientStatusMsg").removeClass("text-danger");
			     			        $("#clientStatusMsg").addClass("text-success");
			     	    		} 
		     		            
			    		    });
			    	     }, 
						"bAutoWidth": false
			    	});
				}else{
					$('#tblCorClientDetails').dataTable().fnClearTable();
			        $("#divErrSearchBRNo,#divErrSearchCorClientCode,#divErrSearchBusinessName").html("One is required.");
			        $("#divErrSearchBRNo,#divErrSearchCorClientCode,#divErrSearchBusinessName").addClass("errors-list mdi mdi-close-circle");
				}
			}
    });
	
	$("#corClientSearch1, #corClientSearch2, #corClientSearch3, #clientSearch3").hide(); 
	
	//when page loading show individual client section
 	$('input[type=radio][name=Client]').val(['Individual']);
		$("#txtCSNIc,#txtCSClientCode,#txtCSSurname,#txtCSInitials,#txtCSTown,#txtCSBRNo,#txtCSCorClientCode,#txtCSBusinessName,#txtCSCorTown").val('');
		    	
	//radio button change function
 	$('input[type=radio][name=Client]').change(function() {
	    $("#clStsMsg").hide();
	    $("#tblGroupClientDetails tbody > tr").remove();
	    if (this.value == 'Individual') {
	        $("#corClientSearch1, #corClientSearch2, #corClientSearch3").hide(); 
		    $("#clientSearch1, #clientSearch2").show();
		    
		    $("#txtCSBRNo,#txtCSCorClientCode,#txtCSBusinessName,#txtCSCorTown").val('');
		    $("#tblCorClientDetails tbody > tr").remove(); 
		    $("#hidParam1").val("I");	       
	    }
	    else if (this.value == 'Corporate') {
	    	$("#clientSearch1, #clientSearch2, #clientSearch3").hide();
		    $("#corClientSearch1, #corClientSearch2").show();
		    
		    $("#txtCSNIc,#txtCSClientCode,#txtCSSurname,#txtCSInitials,#txtCSTown").val('');
		    $("#tblClientDetails tbody > tr").remove();
		    $("#hidParam1").val("C");	    		    	
	    }
	});  
	
	$("#tblClientDetails").click( function() {
		$("#clientSearch3").show();
    });
	
	$("#tblCorClientDetails").click( function() {
		$("#corClientSearch3").show();
    });
	
	$("#payeeApprovalFinance").on('click', function (){
		$("#formSearchClient").attr('action', '${pageContext.request.contextPath}/CR/core/payeeRegistrationApprovalFinance');
		$("#formSearchClient").submit();
	});
	
	$("#payeeApprovalFDSavings").on('click', function (){
		$("#formSearchClient").attr('action', '${pageContext.request.contextPath}/CR/core/payeeRegistrationApprovalFDSavings');
		$("#formSearchClient").submit();
	});
	hideProcessing(); 
});

function deleteConfirmation(formName){
	//alert('varsion : '+$('#hdnVersion').val()+" record : "+$('#hdnClientCode').val());
	var dataArray = {};
    dataArray["clientCode"] = $('#hdnClientCode').val();
    dataArray["version"]    = $('#hdnVersion').val();
    
    var url = '/public/core/deleteClient';
    var isSuccess = ajaxSubmitData(url, dataArray);
    if(isSuccess==1){
    	if($("#hidParam1").val() == "I") { 
    		$('#tblClientDetails').DataTable().ajax.reload();
    	} else if($("#hidParam1").val() == "C") { 
    		$('#tblCorClientDetails').DataTable().ajax.reload();
    	}
    	//$('#divClientBasicInfor').hide();
    }  
}

/* if('${success}'!=''){
	showConfirmationMessage('delete','${delete}');
}

if('${error}'!=''){
	showdeleteNotification('delete','${delete}');
} */

$('#tblClientDetails').on('click', 'a#actionDelete', function (e) {
	showConfirmationMessage('delete','delete');
});

$('#tblCorClientDetails').on('click', 'a#actionDelete', function (e) {
	showConfirmationMessage('delete','delete');
});

function clearButton() {
	$('#txtCSNIc').val('');
	$('#txtCSClientCode').val('');
	$('#txtCSSurname').val('');
	$('#txtCSTown').val('');
	$('#txtCSInitials').val('');
	$('#txtCSBusinessName').val('');
	$('#txtCSBRNo').val('');
	$('#txtCSCorClientCode').val('');
	$('#txtCSCorTown').val('');	
}

</script>