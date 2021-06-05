function count(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup",()=>{

    tax = (itemPrice.value * 0.1 )
    LastPrice = (itemPrice.value) - (tax)

    const AddTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML =`${tax}円`


    const proFit = document.getElementById("profit");
    proFit.innerHTML =LastPrice

  })
}

window.addEventListener('load', count);