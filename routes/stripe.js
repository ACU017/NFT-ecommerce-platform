var express = require('express');
var router = express.Router();
const stripe = require('stripe')(process.env.STRIPE_KEY);




router.post('/create-checkout-session', async (req, res) => {

  // const line_items = req.body.cartItems.map(item => {

  // })
    const session = await stripe.checkout.sessions.create({
      line_items: [
        { 
          price_data: { 
            currency: "inr", 
            product_data: { 
              name: 'product name', 
            }, 
            unit_amount: 30*100, 
          }, 
          quantity: 3, 
        }, 
      ],
      mode: 'payment',
      success_url: `http://localhost:5001`,
      cancel_url: `http://localhost:5001`,
    });
  
    res.send({url: session.url});
  });
  
  module.exports = router