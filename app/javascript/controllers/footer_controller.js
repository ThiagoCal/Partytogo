import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['github']

  connect() {
    this.userInfo();
    console.log('hii')
  }


  fetchUserInfo(user) {
    const url = `https://api.github.com/users/${user}`

    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const html = this.htmlTemplate(data)
        this.githubTarget.innerHTML += html
      })
  }

  userInfo() {
    const usernames = ['ThiagoCal', 'magedeungaro', 'pvbazilio']

    usernames.forEach((user) => {
      this.fetchUserInfo(user)
    })
  }

  htmlTemplate(user){
    return `<a href='${user.html_url}'><img src='${user.avatar_url}' alt='${user.login}' class='round-circle mx-3'></a>`
  }
}
