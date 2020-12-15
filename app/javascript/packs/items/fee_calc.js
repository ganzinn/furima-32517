function fee_calc(){
  const price = document.getElementById("item-price");
  const add_fee = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  function fee_calc_logic(){
    const add_fee_value = Math.floor(price.value * 0.1)
    const profit_value = price.value - add_fee_value
    add_fee.innerText = add_fee_value.toLocaleString();
    profit.innerHTML = profit_value.toLocaleString();
  }
  fee_calc_logic();
  price.addEventListener("keyup",(e) => {
    fee_calc_logic();
  });
}
window.addEventListener("load", fee_calc);