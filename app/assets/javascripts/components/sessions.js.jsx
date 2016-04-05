var LoginForm = React.createClass({
  getInitialState: function(){
    return{email: '', password: ''}
  },
  handleEmailChange: function(e){
    this.setState({email: e.target.value})
  },
  handlePasswordChange: function(e){
    this.setState({password: e.target.value})
  },
  handleSubmit: function(e){
    e.preventDefault();
    var email = this.state.email.trim();
    var password = this.state.password.trim();
    this.props.onLoginSubmit({email: email, password: password})
    this.setState({email: '', password: ''})
  },


  render: function(){
    return(
      <form className = "loginForm" onSubmit={this.handleSubmit}>
        <input
          type="email"
          placeholder="email"
          value={this.state.email}
          onChange={this.handleEmailChange}
        />
        <input
          type="password"
          placeholder="password"
          value={this.state.password}
          onChange={this.handlePasswordChange}
        />
        <input type="submit" value="Post" />
      </form>

    )
  }
})

var LoginBox = React.createClass({
  getInitialState: function(){
    return {data: []};
  },
  handleLoginSubmit: function(session){
    var session = session
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'Post',
      data: session,
      success: function(data){
        console.log("successful login")
      }.bind(this),
      error: function(data){
        console.log("failed login")
          }.bind(this),
    })
  },

  render: function(){
    return(
      <LoginForm onLoginSubmit={this.handleLoginSubmit}/>
    )
  }

})