import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import axios from "axios";

export default function CheckoutSuccess(props) {
  // const [newOrder, setNewOrder] = useState(null);
  // use effect PATCH so we update the paid in the DB => backend will get the las inserted id

  useEffect(() => {
    updateOrderStatus();
  }, []);

  const updateOrderStatus = async () => {
    if (props.id) console.log(props.id);
    try {
      const response = await axios(`/api/orders/ticket/${props.id}`, {
        method: "PATCH"
      });
      
      if (response.status === 200) {
        const updatedOrder = response.data;
        console.log("Order is now fulfilled");
      } else {
        console.log("Failed to update order status");
      }

    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div>
      <title>Thanks for your order!</title>

      <h1>Thanks for your order!</h1>
      <p>
        We appreciate your business! If you have any questions, please email
         <a href="mailto:orders@example.com">orders@nft-store.com</a>.
      </p>

      <button>
        <Link to={`/orders`}>Go to Order</Link>
      </button>
    </div>
  );
}
