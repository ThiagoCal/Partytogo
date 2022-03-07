import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    usernames: Array
  }

  static targets = ['github']

  connect() {

  }


  #fetchUserInfo(user) {
    const url = `https://api.github.com/users/${user}`
    fetch(url)
      .then(response => response.json())
      .then((data) => {

      })
  }

  #userInfo() {
    return this.usernamesValues.map((user) => {
      const info = this.#fetchUserInfo(user)
      this.#htmlTemplate(info)
    })
  }

  #htmlTemplate(user){
    return `<a href='${user.html_url}'><img src='${user.avatar_url}' alt='${user.login}' class='round-circle mx-2'></a>`
  }
}
