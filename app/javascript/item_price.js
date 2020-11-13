window.addEventListener('load', () => {
  
  // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor( inputValue / 10);
    addTaxDom.innerHTML = tax;
    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = Math.floor(inputValue - tax);  
  })
});

