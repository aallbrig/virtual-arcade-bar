function main(){
  const qrCodeImg = document.querySelector("#website-qr-code");
  const qrCodeSourceImage= (window.location.hostname==="localhost") ? `${window.location.hostname.replaceAll(".", "_")}.png` : `${window.location.host.replaceAll(".", "_")}.png`;

  qrCodeImg.src = `./media/qr-codes/${qrCodeSourceImage}`;
}

main();
