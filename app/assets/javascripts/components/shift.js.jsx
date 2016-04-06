
var Shift = React.createClass({
  render: function(){
    return(
      <div className="boxy">
        <StatusBar covered={this.props.covered}/>
        <p>
          {this.props.giver_name}
          <br />
          {this.props.datetime}
        </p>
        <OfferBox shift_id={this.props.shift_id} key={this.props.shift_id} />
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
         <Shift giver_name={shift.giver.name} datetime={shift.datetime} covered={shift.covered} shift_id={shift.id} key={shift.id}>
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

var ShiftFormPlaceholder = React.createClass({
  handleClick: function(e){
    e.preventDefault();
    this.props.onPlusClick();
  },
  render: function(){
    return(
      <div className="boxy placeholder">
        <button className="plus" onClick={this.handleClick}> + </button>
      </div>
    )
  }
})

var ShiftForm = React.createClass({
  getInitialState: function(){
    return{date: '', time: ''}
  },
  handleDateChange: function(e){
    this.setState({date: e.target.value})
  },
  handleTimeChange: function(e){
    this.setState({time: e.target.value})
  },
  handleSubmit: function(e){
    e.preventDefault();
    var date = this.state.date.trim();
    var time = this.state.time.trim();
    this.props.onShiftSubmit({date: date, time: time});
    this.setState({date: '', time: ''});
  },
  render: function(){
    return(
      <form className="shiftForm" onSubmit={this.handleSubmit}>
        <input
          type="date"
          value={this.state.date}
          onChange={this.handleDateChange}
        />
        <input
          type="time"
          value={this.state.time}
          onChange={this.handleTimeChange}
        />
        <input
          type="submit"
          value="Save"
          onSubmit={this.handleSubmit}
        />
      </form>
    )
  }
})

var ShiftBox = React.createClass({
  loadShiftsFromServer: function(){
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: function (data){
        this.setState({data: data.shifts});
      }.bind(this),
      error: function(xhr, status, err){
        console.error(status)
      }.bind(this)
    })
  },
  getInitialState: function(){
    return {data: [], formActive: false};
  },
  componentDidMount: function () {
    this.loadShiftsFromServer();
    setInterval(this.loadShiftsFromServer, this.props.pollInterval)
  },
  handleShiftSubmit: function(shift){
    this.setState({formActive: false})
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: shift,
      success: function(data){
        this.setState({data: data.shifts});
      }.bind(this),
      error: function(xhr, status, err){
        console.error(status);
      }.bind(this)
    });
  },
  handlePlusClick: function(){
    this.setState({formActive: true})
  },
  render: function(){
    var shiftForm;
    if (this.state.formActive === false){
      shiftForm =<ShiftFormPlaceholder onPlusClick={this.handlePlusClick}/>
    } else {
      shiftForm =<ShiftForm onShiftSubmit={this.handleShiftSubmit} />
    }
    return(
      <div className="shiftBox">
        <ShiftList data={this.state.data} />{shiftForm}
      </div>
    );
  }
})