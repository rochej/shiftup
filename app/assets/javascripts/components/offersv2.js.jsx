var OfferButton = React.createClass({
  buttonClick: function(e){
    this.props.onSubmit({type: e.target.value});
    this.props.onToggle(this.props.id, !this.props.selected);
  },
  render: function(){
    var btnClass = this.props.className
    if (this.props.selected) btnClass += " selected"
    return(
      <button
        className={btnClass}
        value={this.props.value}
        onClick={this.buttonClick}>
        {this.props.label}
      </button>
    )
  }
})

var OfferBox = React.createClass({
  getInitialState: function(){
    return {selections: [],
      data:[
        {label: 'Y', value: "yes", id: '0', class: "offerYes"},
        {label: 'M',  value: "maybe", id: '1', class: "offerMaybe"},
        {label: 'N',  value: "no", id: '2', class: "offerNo"}
      ]
    }
  },
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
  onChildToggle: function(id, selected){
    var selections = this.state.selections;
    selections = [];
    selections[id] = selected;
    this.setState({selections: selections});
  },
  buildOfferButtons: function (dataItem){
    return ( < OfferButton
    id={dataItem.id}
    label={dataItem.label}
    value = {dataItem.value}
    className={dataItem.class}
    selected={this.state.selections[dataItem.id]}
    onSubmit= {this.handleSubmit}
    onToggle={this.onChildToggle} />
    )
  },
  render: function(){
    return (
      <div>
        {this.state.data.map(this.buildOfferButtons)}
      </div>
    )
  }
})



