// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import * as bootstrap from "bootstrap"

const $change_password_cb = document.getElementById('change_password_cb');
$change_password_cb.addEventListener('change', () => {
    if ($change_password_cb.checked) {
        document.getElementById('change_password_div').classList.remove('d-none');
    } else {
        document.getElementById('change_password_div').classList.add('d-none');
    }
});