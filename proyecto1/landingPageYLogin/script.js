const faqs = [
  {
    pregunta: "¿Cómo asociarse?",
    respuesta: "Podés completar el formulario de inscripción o acercarte a nuestras reuniones abiertas."
  },
  {
    pregunta: "¿Qué beneficios obtengo?",
    respuesta: "Acceso a vivienda digna, participación activa, apoyo mutuo y desarrollo comunitario."
  },
  {
    pregunta: "¿Qué servicios brinda la cooperativa?",
    respuesta: "Asesoramiento, acompañamiento técnico, espacios de participación y formación."
  },
  {
    pregunta: "¿Quiénes pueden participar?",
    respuesta: "Cualquier persona mayor de edad con voluntad de comprometerse con el proyecto colectivo."
  }
];

let index = 0;
let intervalId;

const questionEl = document.getElementById("faq-question");
const answerEl = document.getElementById("faq-answer");
const faqBox = document.getElementById("faq-box");

function updateFAQ(newIndex) {
  questionEl.style.opacity = 0;
  answerEl.style.opacity = 0;
  setTimeout(() => {
    questionEl.textContent = faqs[newIndex].pregunta;
    answerEl.textContent = faqs[newIndex].respuesta;
    questionEl.style.opacity = 1;
    answerEl.style.opacity = 1;
  }, 300);
}

function nextFAQ() {
  index = (index + 1) % faqs.length;
  updateFAQ(index);
}

function prevFAQ() {
  index = (index - 1 + faqs.length) % faqs.length;
  updateFAQ(index);
}

function startAutoRotate() {
  intervalId = setInterval(nextFAQ, 4000);
}

function stopAutoRotate() {
  clearInterval(intervalId);
}

faqBox.addEventListener("mouseenter", stopAutoRotate);
faqBox.addEventListener("mouseleave", startAutoRotate);

startAutoRotate();

const noticias = [
  {
    noticia: "Fiesta de Integración", 
    noticia1: "El 10 de agosto celebraremos una jornada de integración con juegos para niños, música y merienda compartida. Un espacio para fortalecer vínculos y celebrar nuestros avances.",
    imagen: "imgs/nenes.avif"
  },
  {
    noticia: "Proyecto de Huerta Comunitaria",
    noticia1: "Estamos iniciando el proyecto de huerta colectiva en el predio común. Si querés sumarte al equipo organizador, escribí al correo de la cooperativa o acercate los miércoles de tarde al salón.",
    imagen: "imgs/huerta.webp"
  },
  {
    noticia: "Nuevo Convenio con Mutual de Ahorro",
    noticia1: "Firmamos un acuerdo con la Mutual Solidaria que permitirá acceder a microcréditos para mejoras habitacionales. Pronto compartiremos información detallada en la asamblea.",
    imagen: "imgs/firma.jpg"
  },
  {
    noticia: "Taller de Autoconstrucción",
    noticia1: "El sábado 27 de julio a las 10:00 h invitamos a todos los socios al taller práctico de autoconstrucción. Aprenderemos técnicas básicas de albañilería y pintura. Actividad gratuita con cupos limitados.",
    imagen: "imgs/taller.jpg"
  }
];

let noticiaIndex = 0; // Índice de la noticia actual
let noticiaIntervalId; // Intervalo para rotación automática

const noticia = document.getElementById("noti");
const noticia1 = document.getElementById("noti1");
const noticiaImg = document.getElementById("noti-img");
const noticiaBox = document.getElementById("noti-box");

function updateNoti(newIndex) {
  noticia.style.opacity = 0;
  noticia1.style.opacity = 0;
  noticiaImg.style.opacity = 0;

  setTimeout(() => {
    noticia.textContent = noticias[newIndex].noticia;
    noticia1.textContent = noticias[newIndex].noticia1;
    noticiaImg.src = noticias[newIndex].imagen;
    noticiaImg.alt = noticias[newIndex].noticia;

    noticia.style.opacity = 1;
    noticia1.style.opacity = 1;
    noticiaImg.style.opacity = 1;
  }, 300);
}

function nextNoti() {
  noticiaIndex = (noticiaIndex + 1) % noticias.length;
  updateNoti(noticiaIndex);
}

function prevNoti() {
  noticiaIndex = (noticiaIndex - 1 + noticias.length) % noticias.length;
  updateNoti(noticiaIndex);
}

function startNoticiaAutoRotate() {
  noticiaIntervalId = setInterval(nextNoti, 5000);
}

function stopNoticiaAutoRotate() {
  clearInterval(noticiaIntervalId);
}

noticiaBox.addEventListener("mouseenter", stopNoticiaAutoRotate);
noticiaBox.addEventListener("mouseleave", startNoticiaAutoRotate);

// Mostrar la primera noticia
updateNoti(noticiaIndex);

// Iniciar rotación automática
startNoticiaAutoRotate();
