var Shift = React.createClass({
  render: function(){
    return(
      <div className="shift">
        <StatusBar covered={this.props.covered}/>
        <p>
          {this.props.giver_name}
          {this.props.datetime}
        </p>
      </div>
    )
  }
})

var StatusBar = React.createClass({
  render: function(){
    var divRed = {
      backgroundColor: '#F02F18'
    }
    var divGreen = {
      backgroundColor: '#33FF98'
    }
    return(
      <div className = "statusBar" style={this.props.covered == true ? divGreen : divRed}>
    </div>
    )
  }
})

var ShiftList = React.createClass({
  render: function(){
    var shiftNodes = this.props.data.map(function(shift){
      return(
         <Shift giver_name={shift.giver.name} datetime={shift.datetime} covered={shift.covered} key={shift.id}>
      </Shift>
      );
    });
    return(
      <div className="shiftList">
        {shiftNodes}
      </div>
    );
  }
});

var ShiftBox = React.createClass({
  loadShiftsFromServer: function(){
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function (data){
        this.setState({data: data.shifts});
      }.bind(this),
      error: function(xhr, status, err){
        console.error(status)
      }
    })
  },
  getInitialState: function(){
    return {data: []};
  },
  componentDidMount: function () {
    this.loadShiftsFromServer();
  },

  render: function(){
    return(
      <ShiftList data={this.state.data} />
    );
  }
})