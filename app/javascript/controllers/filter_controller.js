import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["task"]

  connect() {
    this.updateTasks()
    document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
      checkbox.addEventListener('change', () => this.updateTasks())
    })

    // Dropdown functionality
    const dropdownButton = document.getElementById('filter-dropdown-button')
    const dropdownMenu = document.getElementById('filter-dropdown-menu')

    dropdownButton.addEventListener('click', () => {
      dropdownMenu.classList.toggle('hidden')
    })

    document.addEventListener('click', (event) => {
      if (!dropdownButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
        dropdownMenu.classList.add('hidden')
      }
    })
  }

  updateTasks() {
    const selectedCategories = Array.from(document.querySelectorAll('input[type="checkbox"]:checked'))
      .map(checkbox => checkbox.dataset.categoryId)
      .filter(id => id)

    this.taskTargets.forEach(task => {
      const taskCategoryId = task.dataset.categoryId
      if (selectedCategories.length === 0 || selectedCategories.includes(taskCategoryId)) {
        task.classList.remove("hidden")
      } else {
        task.classList.add("hidden")
      }
    })
  }
}