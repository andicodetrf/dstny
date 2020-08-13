$(document).on("turbolinks:load", function () {
    $(`.edit-button`).click(function (e) {
        // if got bugs, comment the .hide() first then use background colour to ensure select correct item
        e.preventDefault()
        e.stopPropagation()
        // $(this).parent().prev().css("display", "block")

        // $(this).hide() ///this to hide the "edit button" on the original show page

        // $(this).parent().prev().prev().hide()
        document.querySelector(".edit_comment").style.display = "block"; //to show the "edit button" from the partial _editcomment
    })
})