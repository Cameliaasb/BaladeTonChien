'use strict';
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"];

  connect() {
    this.initializeCards()
    this.movecard()
  }

  initializeCards() {
    // distributes cards like in a deck
    this.cardTargets.forEach((card, index) => {
      card.style.zIndex = this.cardTargets.length - index;
      card.style.transform = `scale(${(20 - index) / 20}) translateY(-${20 * index}px) rotate(${index}deg)` ;
      card.style.opacity = (10 - index) / 10;
    });

    this.element.classList.add("loaded");
  }

  movecard() {
    // distributes cards like in a deck
    const deck = this.cardTargets
    const tinderContainer = this.element

    // https://hammerjs.github.io/
    this.cardTargets.forEach(function (el) {

      const hammertime = new Hammer(el)
      hammertime.on('pan', function (event) {
        el.classList.add('moving');
        if (event.deltaX === 0) return;
        if (event.center.x === 0 && event.center.y === 0) return;

        tinderContainer.classList.toggle("tinder_love", event.deltaX > 0);
        tinderContainer.classList.toggle("tinder_nope", event.deltaX < 0);
        const xMulti = event.deltaX * 0.03;
        const yMulti = event.deltaY / 80;
        const rotate = xMulti * yMulti;

        el.style.transform = `translate(${event.deltaX}px, ${event.deltaY}px) rotate(${rotate}deg)`;
      });

      hammertime.on("panend", (event) => {

        el.classList.remove("moving");
        tinderContainer.classList.remove("tinder_love");
        tinderContainer.classList.remove("tinder_nope");
        const moveOutWidth = document.body.clientWidth;
        const keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

        if (!keep) {
          el.style.transform = '';
        } else {
          el.classList.add("removed");
          setTimeout(() => {
            el.remove()
          }, 1000);

          const liked = event.deltaX > 0;
          if (liked) {
            const csrfToken = document.querySelector("[name='csrf-token']").content
            fetch("/tindogs", {
              method: "POST",
              headers: {
                "X-CSRF-Token": csrfToken,
                "Content-Type": "application/json",
                "Accept": "plain/text"
              },
              body: JSON.stringify({
                receiver_id: el.dataset.receiverId,
              })
            })
              .then(response => response.text())
              .then(data => {
                setTimeout(() => {
                  document.body.insertAdjacentHTML("beforeend", data)
                }, 500);
              })
          }

          const endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
          const toX = event.deltaX > 0 ? endX : -endX;
          const endY = Math.abs(event.velocityY) * moveOutWidth;
          const toY = event.deltaY > 0 ? endY : -endY;
          const xMulti = event.deltaX * 0.03;
          const yMulti = event.deltaY / 80;
          const rotate = xMulti * yMulti;
          el.style.transform = `translate(${toX}px, ${toY + event.deltaY}px) rotate(${rotate}deg)`;
          const newCards = deck.filter((toto) => {
            return !toto.classList.contains("removed")
          })

          newCards.forEach((card, index) => {
            card.style.zIndex = deck.length - index;
            card.style.transform = `scale(${(20 - index) / 20}) translateY(-${30 * index}px) rotate(${index * 2}deg)` ;
            card.style.opacity = (10 - index) / 10;
          });
          tinderContainer.classList.add("loaded");
        }
      });

    })
  }

  nope(event) {
    event.preventDefault();
    const deck = this.cardTargets
    const cards  = this.cardTargets.filter((card) => !card.classList.contains("removed"));
    const moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    const card = cards[0];
    card.classList.add("removed");
    card.style.transform = `translate(-${moveOutWidth}px, -100px) rotate(-30deg)`;
    const newCards = deck.filter((toto) => {
      return !toto.classList.contains("removed")
    })
    card.classList.remove();

    newCards.forEach((card, index) => {
      card.style.zIndex = deck.length - index;
      card.style.transform = `scale(${(20 - index) / 20}) translateY(-${30 * index}px) rotate(${index * 2}deg)` ;
      card.style.opacity = (10 - index) / 10;
    });
  }

  love(event) {
    event.preventDefault();
    const deck = this.cardTargets
    const cards  = this.cardTargets.filter((card) => !card.classList.contains("removed"));
    const moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    const card = cards[0];
    card.classList.add("removed");
    card.style.transform = `translate(${moveOutWidth}px, -100px) rotate(-30deg)`;
    const csrfToken = document.querySelector("[name='csrf-token']").content
    fetch("/tindogs", {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json",
        "Accept": "plain/text"
      },
      body: JSON.stringify({
        receiver_id: card.dataset.receiverId,
      })
    })
    .then(response => response.text())
    .then(data => {
        setTimeout(() => {
          document.querySelector('body').insertAdjacentHTML("beforeend", data)
        }, 500);
      })

    const newCards = deck.filter((toto) => {
      return !toto.classList.contains("removed")
    })
    card.classList.remove();

    newCards.forEach((card, index) => {
      card.style.zIndex = deck.length - index;
      card.style.transform = `scale(${(20 - index) / 20}) translateY(-${30 * index}px) rotate(${index * 2}deg)` ;
      card.style.opacity = (10 - index) / 10;
    });
  }

  remove(event) {
    event.preventDefault();
  }

}
