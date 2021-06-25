function count(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup",()=>{

    tax = Math.round(itemPrice.value * 0.1 )
    lastprice = (itemPrice.value) - (tax)

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML =tax


    const proFit = document.getElementById("profit");
    proFit.innerHTML =lastprice

  });
};

window.addEventListener('load', count);