<template>
  <div class="galleryContainer">
    
    <div class="numberText">{{currentImage + 1}}/{{numberOfImages}}</div>
    <img :src="images[currentImage].pathLong" class="image">    
    <div></div>

    <a class="prev" @click="prevSlide">&#10094;</a>
    <a class="next" @click="nextSlide">&#10095;</a>   

    <div class="circles">
      <template v-for="image in images" :key="image.pathShort">
        <div v-if="currentImage !== images.indexOf(image)" class="circle">
          <span class="dot" @click="chooseImage(images.indexOf(image))"></span>
        </div>
        <div v-else class="circle">
          <span class="dot active" @click="chooseImage(images.indexOf(image))"></span>
        </div>
      </template>
    </div>
    
  </div>
</template>

<script>
export default {
    name: "MyGallery",
    data() {
      return {
        images: [],
        numberOfImages: "",
        currentImage: ""
      }
    },
    created() {
      this.importAllMiniatures(require.context('../../assets/gallery/min/', true, /\.jpg$/));
      this.numberOfImages = this.images.length;
      this.currentImage = 0;
    },
    mounted() {
      this.moveSlide();
    },
    methods: {
      importAllMiniatures(resource) {
          resource.keys().forEach(key => {
          this.images.push({pathLong: resource(key), pathShort: key});
        })
      },
      prevSlide() {
        if (this.currentImage <= 0) {
          this.currentImage = this.numberOfImages -1;
        }
        else {
          this.currentImage -= 1;
        }
      },
      nextSlide() {
        if (this.currentImage >= this.numberOfImages -1) {
          this.currentImage = 0;
        }
        else {
          this.currentImage += 1;
        }
      },
      moveSlide() {
        this.nextSlide();
        setTimeout(() => this.moveSlide(), 5000);
      },
      chooseImage(item) {
        this.currentImage = item;
      },
      enlarge(item) {
        console.log(item.pathShort);
      }
    }
}
</script>

<style scoped>

.galleryContainer {
  width: 660px;
  position: relative;
}
.image {
  width: 100%;
}
.circles {
  text-align: center;
}
.numberText {
  color: aliceblue;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: aliceblue;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
.prev:hover, .next:hover {
  background-color: rgb(69, 127, 236);
}
.circle {
  padding: 5px;
  width: 10px;
  display: inline-block;
}
.dot {
  cursor: pointer;
  height: 10px;
  width: 10px;
  margin: 0 2px;
  background-color: cornflowerblue;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.dot:hover, .active {
  background-color: white;
}
</style>