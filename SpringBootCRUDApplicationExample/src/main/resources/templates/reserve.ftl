<div class="container">
<form>
    <div class="form-group">
        <label for="chooseType">Choose object type</label>
        <select class="form-control" id="chooseType">
            <option>Cinemas</option>
            <option>Theatres</option>
        </select>
    </div>
    <div  class="form-group">
        <label for="chooseType">Choose cultural object</label>
        <select class="form-control">
            <option>Default select</option>
        </select>
    </div>
    <div  class="form-group">
        <label for="chooseType">Choose Projection</label>
        <select class="form-control">
            <option>Default select</option>
        </select>
    </div>
    <md-content layout-padding="" ng-cloak="" class="datepickerdemoBasicUsage">
    <div flex-gt-xs>
      <label for="datePicker">Standard date-picker</label>
      <md-datepicker id="datePicker" ng-model="reserveCtrl.myDate" md-placeholder="Enter date"></md-datepicker>
    </div>
    </md-content>
    <div class="container-fluid">
    <div class="row flex-row flex-nowrap">
        <div class="col-3">
             <md-card md-theme="{{ 'dark-grey' }}" md-theme-watch>
        <md-card-title>
          <md-card-title-text>
            <span class="md-headline">Card with image</span>
            <span class="md-subhead">Small</span>
          </md-card-title-text>
          <md-card-title-media>
            <div class="md-media-sm card-media"></div>
          </md-card-title-media>
        </md-card-title>
        <md-card-actions layout="row" layout-align="end center">
          <md-button>Action 1</md-button>
          <md-button>Action 2</md-button>
        </md-card-actions>
      </md-card>
        </div>
        <div class="col-3">
            <div class="card card-block">Card</div>
        </div>
        <div class="col-3">
            <div class="card card-block">Card</div>
        </div>
        <div class="col-3">
            <div class="card card-block">Card</div>
        </div>
    </div>
</div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>