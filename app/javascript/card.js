// const pay = () => {
//   const saveCard = document.getElementById("save_card")
//   if (document.getElementById("save_card")) {
//   return saveCard;
//   };
//   Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
//   Payjp.setPublicKey("pk_test_3820c2e74736c44433ee31e8");// PAY.JPテスト公開鍵
//   const submit = document.getElementById("button");
//   submit.addEventListener("click", (e) => {
//     e.preventDefault();

//     const formResult = document.getElementById("charge-form");
//     const formData = new FormData(formResult);

//     const card = {
//       number: formData.get("purchase_shipping[number]"),
//       cvc: formData.get("purchase_shipping[cvc]"),
//       exp_month: formData.get("purchase_shipping[exp_month]"),
//       exp_year: `20${formData.get("purchase_shipping[exp_year]")}`,
//     };

//     Payjp.createToken(card, (status, response) => {
//       if (status == 200) {
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form");
//         const tokenObj = `<input value=${token} name='token' type="hidden"> `;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
//       }

//       document.getElementById("card_number").removeAttribute("name");
//       document.getElementById("card_cvc").removeAttribute("name");
//       document.getElementById("card_exp_month").removeAttribute("name");
//       document.getElementById("card_exp_year").removeAttribute("name");
    
//       document.getElementById("charge-form").submit();
//     });
//   });
// };

// window.addEventListener("load", pay);