window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   
   const addTaxDom = document.getElementById("add-tax-price")
   addTaxDom.innerHtml = Math.floor(inputValue * 0.1)
   addTax = addTaxDom.innerHtml
   console.log(addTax)

   const profitDom = document.getElementById("profit")
   profitDom.innerHtml = Math.floor(inputValue - inputValue * 0.1)
   profit = profitDom.innerHtml
   console.log(profit)
})
})