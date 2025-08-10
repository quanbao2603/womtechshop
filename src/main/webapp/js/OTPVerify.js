const inputs = document.querySelectorAll(".otp-inputs input");

inputs.forEach((input, index) => {
    input.addEventListener("input", () => {
        if (input.value.length === 1 && index < inputs.length - 1) {
            inputs[index + 1].focus();
        }
    });

    input.addEventListener("keydown", (e) => {
        // Nếu nhấn Backspace và ô đang rỗng → chuyển về ô trước
        if (e.key === "Backspace" && input.value === "" && index > 0) {
            inputs[index - 1].focus();
        }
    });
});

// Gộp mã OTP trước khi submit
const form = document.getElementById("otp-form");
form.addEventListener("submit", function (e) {
    let otp = "";
    inputs.forEach(input => otp += input.value);

    const hidden = document.createElement("input");
    hidden.type = "hidden";
    hidden.name = "otp";
    hidden.value = otp;
    form.appendChild(hidden);
});