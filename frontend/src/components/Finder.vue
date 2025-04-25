<template>
    <section class="finder">
        <div class="container">
            <div class="job-matching">

                <div class="title-top">
                    <img :src="jobMatching.image" alt="Job Matching" />
                    <p>{{ jobMatching.text }}</p>
                </div>

                <div class="sessions-container">
                    <div class="session-item" v-for="(session, index) in jobMatching.sessions"
                        :key="`job-matching-${index}`">
                        <h3>{{ session.title }}</h3>
                        <div class="session-slots">
                            <div class="slots-item" v-for="(slot, i) in session.slots" :key="`job-matching-slot-${i}`"
                                data-aos="fade-left" data-aos-delay="500">
                                {{ slot.label }}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="talks-container">
                    <h1>{{ talks.title }}</h1>
                    <div class="session-item" v-for="(session, index) in talks.sessions" :key="`talks-${index}`">
                        <h3>{{ session.title }}</h3>
                        <div class="session-slots">
                            <div class="slots-item" v-for="(slot, i) in session.slots" :key="`talks-slot-${i}`"
                                data-aos="fade-right" data-aos-delay="500">
                                {{ slot.label }}
                            </div>
                        </div>
                    </div>
                </div>

                <a class="visitor-button" href="#" @click.prevent="showModal = true">
                    {{ button.label }}
                </a>

                <img :src="ads" alt="Advertisement" />
            </div>
        </div>

        <div v-if="showModal" class="modal-overlay" @click.self="closeModal">
            <div class="modal-content">
                <h2>Register as Visitor</h2>
                <form @submit.prevent="submitForm">
                    <label>
                        Name:
                        <input type="text" v-model="form.name" required />
                    </label>

                    <label>
                        Email:
                        <input type="email" v-model="form.email" required />
                    </label>

                    <label>
                        Phone Number:
                        <input type="tel" v-model="form.phone" required />
                    </label>

                    <label>
                        Select Session:
                        <select v-model="form.selectedSession" required>
                            <option value="" disabled>Select a session</option>
                            <option v-for="(session, i) in availableSessions" :key="i" :value="session">
                                {{ session }}
                            </option>
                        </select>
                    </label>

                    <div class="modal-buttons">
                        <button type="submit">Submit</button>
                        <button type="button" @click="closeModal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: "Finder",
    data() {
        return {
            jobMatching: {
                image: new URL("@/assets/image/jobMatching.png", import.meta.url).href,
                text: "Each session will have 12 recruiters and up to 24 jobseekers. Each discussion will be 2 minutes. Jobseekers will move to the next recruiter when times are up. The recruiter remains at their place. A lucky draw for the jobseekers will be done at the end of the session.",
                sessions: [
                    {
                        title: "Day 1 - 24 May 2025, Saturday",
                        slots: [
                            { label: "9:00 AM" },
                            { label: "11:00 AM" },
                            { label: "2:00 PM" },
                        ],
                    },
                    {
                        title: "Day 2 - 25 May 2025, Sunday",
                        slots: [
                            { label: "10:00 AM" },
                            { label: "12:00 PM" },
                            { label: "3:00 PM" },
                        ],
                    },
                ],
            },
            talks: {
                title: "Career Talk Session",
                sessions: [],
            },
            button: {
                label: "BE OUR VISITOR",
                path: "#",
            },
            ads: new URL("@/assets/image/advertisement.png", import.meta.url).href,
            showModal: false,
            form: {
                name: "",
                email: "",
                phone: "",
                selectedSession: "",
            },
        };
    },
    computed: {
        availableSessions() {
            const jobSlots = this.jobMatching.sessions.flatMap((s) =>
                s.slots.map((slot) => `${s.title} - ${slot.label}`)
            );
            const talkSlots = this.talks.sessions.flatMap((s) =>
                s.slots.map((slot) => `${s.title} - ${slot.label}`)
            );
            return [...jobSlots, ...talkSlots];
        },
    },
    mounted() {
        this.fetchCareerTalks();
    },
    methods: {
        async fetchCareerTalks() {
            try {
                const response = await fetch(
                    "http://localhost/smg/backend/api/get_career_talks.php"
                );
                if (!response.ok) throw new Error("Failed to fetch career talks");

                const data = await response.json();

                this.talks = {
                    title: data?.title || "Career Talk Session",
                    sessions: (data?.sessions || []).map((day) => ({
                        title: day.title,
                        slots: (day.sessions || []).map((slot) => ({
                            label: slot.title,
                        })),
                    })),
                };
            } catch (error) {
                console.error("Error fetching career talks:", error);
            }
        },
        closeModal() {
            this.showModal = false;
        },
        submitForm() {
            const payload = {
                name: this.form.name,
                email: this.form.email,
                phone: this.form.phone,
                session: this.form.selectedSession,
            };

            fetch("http://localhost/smg/backend/api/register_visitor.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(payload),
            })
                .then((response) => {
                    if (!response.ok) throw new Error("Failed to submit form");
                    return response.json();
                })
                .then((data) => {
                    console.log("Response:", data);
                    alert("Thank you for registering!");
                    this.closeModal();

                    this.form = {
                        name: "",
                        email: "",
                        phone: "",
                        selectedSession: "",
                    };
                })
                .catch((error) => {
                    console.error("Submission error:", error);
                    alert("There was an error submitting the form. Please try again.");
                });
        }

    },
};
</script>

<style scoped>
.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
}

.modal-content {
    background: #fff;
    color: #333;
    padding: 2rem;
    border-radius: 1rem;
    width: 90%;
    max-width: 500px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
}

.modal-content h2 {
    margin-bottom: 1rem;
    font-size: 1.5rem;
}

.modal-content label {
    display: block;
    margin-bottom: 1rem;
    font-size: 1rem;
}

.modal-content input,
.modal-content select {
    width: 100%;
    padding: 0.5rem;
    margin-top: 0.3rem;
    border-radius: 5px;
    border: 1px solid #ccc;
    background: #FFFFFF;
}

.modal-buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 1.5rem;
}

.modal-buttons button {
    padding: 0.7rem 1.2rem;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
}

.modal-buttons button:first-child {
    background-color: #40a315;
    color: white;
}

.modal-buttons button:last-child {
    background-color: #ccc;
}

.finder {
    background: url("@/assets/image/bg.png") top center/cover no-repeat;
    color: #fff;
}

.container {
    padding-bottom: 5.6rem;
}

.job-matching {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 4.4rem;
}

.title-top {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    gap: 12px;
}

.title-top img {
    width: 29.5rem;
}

p {
    max-width: 29%;
}

h1,
h3,
p {
    color: #fff;
}

h3 {
    font-size: 1.8rem;
    font-weight: normal;
}

.sessions-container,
.talks-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 2rem;
}

.session-item {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

.session-slots {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 2rem;
}

.slots-item {
    min-width: 16.7rem;
    height: 5.3rem;
    padding: 0 12px;
    background-color: #e9afaf;
    border-radius: 1.5rem;
    display: flex;
    align-items: center;
    justify-content: center;
}

.visitor-button {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 18.8rem;
    height: 5.5rem;
    color: #fff;
    background: #40a315;
    border-radius: 35px;
    text-decoration: none;
    font-size: 1.8rem;
    font-weight: bold;
    transition: transform 0.4s ease-in-out;
}

.visitor-button:hover {
    transform: scale(1.1);
}

@media screen and (max-width: 768px) {
    .container {
        padding: 0 10px;
    }

    .title-top {
        flex-direction: column;
    }

    .title-top img {
        width: 50vw;
    }

    .job-matching {
        gap: 24px;
    }

    p {
        max-width: 80vw;
    }

    h3 {
        font-size: 1.3rem;
    }

    .session-slots {
        gap: 1rem;
    }

    .slots-item {
        min-width: 7rem;
        height: 3rem;
        padding: 0 8px;
        border-radius: 1rem;
    }

    .visitor-button {
        width: 10rem;
        height: 3rem;
        font-size: 1rem;
        border-radius: 1rem;
    }

    img {
        width: 80vw;
    }
}
</style>