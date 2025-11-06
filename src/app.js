const BACKEND_URL = window.BACKEND_URL || "https://<TU-SERVICIO>.run.app";
document.getElementById("btn").onclick = async () => {
  const f = document.getElementById("file").files[0];
  if (!f) return alert("Selecciona una imagen");
  const fd = new FormData(); fd.append("file", f);
  const r = await fetch(`${BACKEND_URL}/predict`, { method: "POST", body: fd });
  const j = await r.json();
  document.getElementById("out").textContent = JSON.stringify(j, null, 2);
};