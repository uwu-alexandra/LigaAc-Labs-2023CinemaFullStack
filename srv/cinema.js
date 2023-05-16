const cds = require('@sap/cds');

class CinemaAdmin extends cds.ApplicationService {
    async init() {
        this.before("CREATE", "Rooms", async (req) => {
            // Check the value of capacity
            const { CAPACITY: capacity } = req.data
            if (capacity > 100) throw Error('Capacity cannot be bigger than 100!');

            // Populate ID column from database sequence
            const [{SEQ: room_id}] = await cds.run(`SELECT "ID".nextval as SEQ FROM dummy;`);
            req.data.ID = room_id;
        })

        this.before("CREATE", "Movies", async (req) => {       
            // Populate ID column from database sequence
            const [{SEQ: movie_id}] = await cds.run(`SELECT "ID".nextval as SEQ FROM dummy;`);
            req.data.ID = movie_id;
        })
        await super.init()
    }
}
module.exports = CinemaAdmin;