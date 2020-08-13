console.log('test')

function addOptionInput(){

  $("#addMore").on("click", function(e) {
    console.log('test')
    e.preventDefault(); //kill default action
    let numberIdOfRow = $(".listForm .row:last-child").attr("data-id");
    let num = parseInt(numberIdOfRow) + 1;
  
  
    let html = `<div class="row mb-3" data-id="${num}">
                <div class="col-md-11">
                    <input class="form-control mb-1" type="text" name="question[options_attributes][${num}][option_text]" id="question_options_attributes_${num}_option_text" placeholder="Option (Required)">
                </div>
                <div class="col-md-1 stayEnd"><button class="btn btn-danger del"> x</button></div>
                </div>`;
  
    $(".listForm").append(html);
    console.log('added'+num+' - '+numberIdOfRow)
  });
  
  $(".listForm").on("click", ".del", function(e) {
    e.preventDefault();
    /*
        Find the parent of the parent of the del button 
        and completely remove it from the html
    */
    $(this)
      .parent()
      .parent()
      .remove();
      console.log('del')
  });
  };
  
  function displayToolTip(){
    $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    })
  }
  export { addOptionInput, displayToolTip }
  

  //------------ SUPERSEDED CODES ---------------

// const addOptionInput = ()=> {
//   console.log('does it go here?')
// // $(document).ready(function () {
//   const createButton = document.getElementById("addBook");
//   createButton.addEventListener("click", () => {

//     const lastId = document.querySelector("#fieldsetContainer").lastElementChild.id; //to_get the last created child id

//     const newId = parseInt(lastId, 10) + 1; //incremenet to get unique id  

//     //to get previous id-1 fieldset and replace with 2
//     const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/0/g,newId);

//     document.querySelector("#fieldsetContainer").insertAdjacentHTML(
//         "beforeend", newFieldset
//     );
//   });
// // });
// }
// export { addOptionInput }