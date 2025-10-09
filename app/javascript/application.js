// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import * as bootstrap from "bootstrap"

document.addEventListener('turbo:load', () => {
    const $change_password_cb = document.getElementById('change_password_cb');
    const $all_password_inputs = document.querySelectorAll('input[type="password"]');

    if (!$change_password_cb)
        return

    $change_password_cb.addEventListener('change', () => {
        if ($change_password_cb.checked) {
            $all_password_inputs.forEach((ele) => { ele.disabled = false });
            document.getElementById('change_password_div').classList.remove('d-none');
        } else {
            $all_password_inputs.forEach((ele) => { ele.disabled = true });
            document.getElementById('change_password_div').classList.add('d-none');
        }
    });
});