var Shift = React.createClass({
  render: function(){
    return(
      <div className="shift">
        <p>{this.props.giver_id} </p>
        {this.props.datetime}
        {this.props.covered}
      </div>
    )
  }
})

var ShiftList = React.createClass({
  render: function(){
    var shiftNodes = this.props.data.map(function(shift){
      return(
         <Shift giver_id={shift.giver_id} datetime={shift.datetime} covered={shift.covered} key={shift.id}>
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
        this.setState({data: data});
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