// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("packs/addOptionInput")
require('packs/comments')
require('jquery')
require('bootstrap')
require("@rails/ujs").start()
require('data-confirm-modal')  // DANGER DANGER HAHAHAHA
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import { addOptionInput } from "packs/addOptionInput"
import { displayToolTip } from "./addOptionInput"

document.addEventListener("turbolinks:load", () => {
displayToolTip();
    if (document.querySelector(".listForm")) {
        console.log('in app.js')
        addOptionInput()

    }
    console.log('outside app.js')
})