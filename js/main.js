const app = Vue.createApp({
    created() {
        fetch('http://localhost:8888/Lie_Keith_HW3/bikinibottom_API/lumen/public/houses')
        .then(response => response.json())
        .then(data => {
            // console.log(data)
            this.housesData = data;
            this.loadingHouses = false;
        })
        .catch(error => console.error(error));
    },
    data() {
        return {
            housesData: [],
            name: "",
            date_built: "",
            bio: "",
            job: "",
            image: "",
            error: "",
            loadingHouses: true,
            loading: false
        }
    },
    methods: {
        getHouse(id) {
            this.loading = true;
            console.log(id);
            fetch(`http://localhost:8888/Lie_Keith_HW3/bikinibottom_API/lumen/public/houses/${id}`)
            .then(response => response.json())
            .then(data => {
                this.loading = false;
                if(data && data.id) {
                    const housesData = data;
                    console.log(housesData);
                    this.name = housesData.owner_name ? housesData.owner_name : 'Not available';
                    this.date_built = housesData.date_built ? housesData.date_built : 'Not available';
                    this.bio = housesData.bio ? housesData.bio : 'Not available'
                    this.job = housesData.job ? housesData.job : 'Not available'
                    this.image = housesData.house_img ? housesData.house_img : 'Not available'
                    console.log(image);
                } else {
                    this.error = "No house found with the given query";
                }
            })
            .then(document.documentElement.scrollIntoView({behavior: 'smooth', block: 'end'}))
            .catch(error => console.error(error));
        }
    }
}).mount("#app")
