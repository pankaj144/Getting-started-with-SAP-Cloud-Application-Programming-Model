const cds = require('@sap/cds');

class CatalogService extends cds.ApplicationService{
    init(){
        const { Books } = this.entities;

        this.after('READ', Books, this.grantDiscount);

        this.on('submitOrder', this.reduceStock);

        return super.init();
    }

    async reduceStock(req){
         /* !!! This is only a preliminary, incomplete implementation of the submitOrder action. !!!
           !!! In the next lesson, we will learn how to use queries.                            !!!
           !!! These will then be used to complete the implementation.                          !!! */
           
        const { Books } = this.entities;
        const { book, quantity } = req.data;

        /**
         * At least quantity should be 1.
         */
        if(quantity < 1){
            return req.error('INVALID_QUANTITY');
        }

        /**
         * select stock before update the stock
         */
        const b = await SELECT.one.from(Books).where({ ID: book}).columns(b => { b.stock} );
        //let query1 = SELECT.one.from(Books).where`ID=${book}`.columns`stock`;
        //const b = await cds.db.run(query);

        if(!b){
            return req.error('BOOK_NOT_FOUND',[book]);
        }

        let { stock } = b;

        if(quantity > stock){
            return req.error('ORDER_EXCEEDS_STOCK',[quantity, stock, book]);
        }

        await UPDATE(Books).where({ID: book}).with({stock: { '-=' : quantity}});

        //let query2 = UPDATE(Books).where`ID=${book}`.with`stock = stock - ${quantity}`;
        
        //let stock = 10;

        return { stock: stock - quantity };
    }

    grantDiscount(results) {
        for(let b of results){
            if(b.stock > 200){ b.title += ' -- 11% Discount!'; }
        }
    }

}

module.exports = CatalogService;