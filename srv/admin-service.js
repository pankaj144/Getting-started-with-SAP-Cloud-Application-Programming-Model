const cds = require('@sap/cds');


class AdminService extends cds.ApplicationService{
    init(){
        const { Authors, Books } = this.entities;

         // Validate the life data entered for an author
        this.before(['CREATE','UPDATE'], Authors, this.validateLifeData);

         this.after('READ', Books, this.grantDiscount);
        
        return super.init();
    }

    validateLifeData(req){
        const{ dateOfBirth, dateOfDeath } = req.data;
        if(!dateOfBirth || !dateOfDeath){
            return;
        }

        const birth = new Date(dateOfBirth);
        const death = new Date(dateOfDeath);

        if(death < birth){
            req.error('DEATH_BEFORE_BIRTH',[dateOfDeath,dateOfDeath]);
        }
    }

     grantDiscount(results) {
        for(let b of results){
            if(b.stock > 10){ b.title += ' -- 11% Discount!'; }
        }
    }
}

module.exports = AdminService;