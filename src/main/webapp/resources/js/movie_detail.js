// 탭 기능 구현
document.addEventListener("DOMContentLoaded", function () {
  const tabs = document.querySelectorAll(".tab");
  const tabContents = document.querySelectorAll(".tab-content");

  tabs.forEach((tab) => {
    tab.addEventListener("click", function () {
      const targetTab = this.getAttribute("data-tab");

      // 모든 탭과 콘텐츠에서 active 클래스 제거
      tabs.forEach((t) => t.classList.remove("active"));
      tabContents.forEach((content) => content.classList.remove("active"));

      // 클릭한 탭과 해당 콘텐츠에 active 클래스 추가
      this.classList.add("active");
      document.getElementById(targetTab).classList.add("active");
    });
  });
});

// 비디오 변경 함수
function changeVideo(videoUrl, element) {
  const mainVideo = document.getElementById("mainVideo");
  mainVideo.src = videoUrl + "?autoplay=1";

  // 모든 썸네일에서 active 클래스 제거
  document.querySelectorAll(".video-thumbnail").forEach((thumb) => {
    thumb.classList.remove("active");
  });

  // 클릭한 썸네일에 active 클래스 추가
  element.classList.add("active");
}

// 비디오 캐러셀 스크롤 함수
// function scrollVideos(direction) {
//   const carousel = document.getElementById("videoCarousel");
//   const scrollAmount = 215; // 썸네일 너비 + 간격

//   if (direction === "left") {
//     carousel.scrollBy({ left: -scrollAmount, behavior: "smooth" });
//   } else {
//     carousel.scrollBy({ left: scrollAmount, behavior: "smooth" });
//   }
// }
