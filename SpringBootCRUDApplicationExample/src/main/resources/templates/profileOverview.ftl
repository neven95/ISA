<div class="container bootstrap snippet">
<div class="panel-body inf-content">
    <div class="row">
        <div class="col-md-4">
            <img alt="" style="width:600px;" title="" class="img-circle img-thumbnail isTooltip" src="https://bootdey.com/img/Content/user-453533-fdadfd.png" data-original-title="Usuario"> 
            <ul title="Ratings" class="list-inline ratings text-center">
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
            </ul>
        </div>
        <div class="col-md-6">
            <a ng-show="globals.currentUser.userType == '0'" href="#">Change user and password!</a>
            <strong>Information</strong><br>
            <div class="table-responsive">
            <table class="table table-condensed table-responsive table-user-information">
                <tbody>
                    <tr>    
                        <td>
                            <strong>
                                <i class="fas fa-user-circle" style="color:#009CDA"></i>
                                Name                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            {{profCtrl.userData.firstName}}     
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <i class="fas fa-user-circle" style="color:#009CDA"></i>
                                Lastname                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            {{profCtrl.userData.lastName}}  
                        </td>
                    </tr>

                    <tr>        
                        <td>
                            <strong>
                                <i class="fas fa-bookmark" style="color:#009CDA"></i> 
                                Username                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            {{profCtrl.userData.username}} 
                        </td>
                    </tr>


                    <tr>        
                        <td>
                            <strong>
                                <i class="fas fa-eye" style="color:#009CDA"></i>
                                Role                                                
                            </strong>
                        </td>
                        <td class="text-primary" ng-if="profCtrl.userData.type==0">
                            Basic user
                        </td>
                        <td class="text-primary" ng-if="profCtrl.userData.type==1">
                            Cultural object admin
                        </td>
                        <td class="text-primary" ng-if="profCtrl.userData.type==2">
                            System admin
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <i class="fas fa-envelope" style="color:#009CDA"></i>
                                Email                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            {{profCtrl.userData.email}}  
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <i class="fas fa-map-marker" style="color:#009CDA"></i>
                                City                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            {{profCtrl.userData.city}}
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <i class="fas fa-phone" style="color:#009CDA"></i>
                                Phone                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                             {{profCtrl.userData.phoneNumber}}
                        </td>
                    </tr>                                    
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>
</div> 