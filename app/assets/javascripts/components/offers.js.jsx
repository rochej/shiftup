
var OfferButtons = React.createClass({
  getInitialState: function(){
    return {type: ''}
  },
  buttonClick: function(e){
    this.setState({type: e.target.value});
    this.props.onSubmit({type: e.target.value});
  },
  render: function(){
    return(
      <div className="offerButtons">
        <button
          className="offer offerYes"
          value="yes"
          onClick={this.buttonClick}> Y
        </button>
        <button
          className="offer offerMaybe"
          value="maybe"
          onClick={this.buttonClick}> M
        </button>
        <button
          className="offer offerNo"
          value="no"
          onClick={this.buttonClick}> N
        </button>
      </div>
    )
  }
})

var OfferBox = React.createClass({
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
      <OfferButtons onSubmit={this.handleSubmit} />
    )
  }
})