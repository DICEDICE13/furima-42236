const price = () => {
  const priceInput = document.getElementById("item-price");
  const taxOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const value = priceInput.value;

      if (/^\d+$/.test(value)) {
        const price = parseInt(value);
        if (price >= 300 && price <= 9999999) {
          const fee = Math.floor(price * 0.1);
          const profit = Math.floor(price - fee);
          taxOutput.textContent = fee;
          profitOutput.textContent = profit;
        } else {
          taxOutput.textContent = "-";
          profitOutput.textContent = "-";
        }
      } else {
        taxOutput.textContent = "-";
        profitOutput.textContent = "-";
      }
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);