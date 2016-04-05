var OfferButtonNo = React.createClass({
  getInitialState: function(){
    return {type: '', isPressed: false}
  },
  buttonClick: function(e){
    this.setState({type: e.target.value, isPressed: true});
    this.props.onSubmit({type: e.target.value});
  },
  render: function(){
    var btnClassNo = classNames({
      'offer': true,
      'offerNo': true,
      'selectedNo': this.state.isPressed,
    })
    return(
      <button
        className={btnClassNo}
        value="no"
        onClick={this.buttonClick}>N
      </button>
    )
  }
})

var OfferButtonMaybe = React.createClass({
  getInitialState: function(){
    return {type: '', isPressed: false}
  },
  buttonClick: function(e){
    this.setState({type: e.target.value, isPressed: true});
    this.props.onSubmit({type: e.target.value});
  },
  render: function(){
    var btnClassMaybe = classNames({
      'offer': true,
      'offerMaybe': true,
      'selectedMaybe': this.state.isPressed,
    })
    return(
      <button
        className= {btnClassMaybe}
        value="maybe"
        onClick={this.buttonClick}>M
      </button>
    )

  }
})

var OfferButtonYes = React.createClass({
  getInitialState: function(){
    return {type: '', isPressed: false}
  },
  buttonClick: function(e){
    this.setState({type: e.target.value, isPressed: true});
    this.props.onSubmit({type: e.target.value});
  },
  render: function(){
    var btnClassYes = classNames({
      'offer': true,
      'offerYes': true,
      'selectedYes': this.state.isPressed,
    })
    return(
      <button
        className= {btnClassYes}
        value="yes"
        onClick={this.buttonClick}>Y
      </button>
    )
  }
})

var OfferBox2 = React.createClass({
  handleSubmit: function(data){
    var url = "shifts/" + this.props.shift_id +"/offers"
    $.ajax({
      url: url,
      data: data,
      dataType: 'json',
      method: 'POST',
      success: function(data){
        console.log("success")
      }.bind(this),
      error: function(xhr, status, err){
        console.error(status)
      }.bind(this)
    });
  },
  render: function(){

    return(
      <div className="offerButtons">
        <OfferButtonYes isPressed= {this.state.isPressed} onSubmit={this.handleSubmit} />
        <OfferButtonMaybe isPressed= {this.state.isPressed} onSubmit={this.handleSubmit} />
        <OfferButtonNo isPressed= {this.state.isPressed} onSubmit={this.handleSubmit} />
      </div>
    )
  }
})