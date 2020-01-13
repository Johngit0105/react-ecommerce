import React, { Component } from 'react';
import axios from 'axios';

const Item = props => (
  <div className="card" style={{ width: '18rem' }}>
    <div
      className="card-body"
      onClick={() => {
        props.push(`/details/${props.item.product_id}`, props.item.product_id);
      }}
    >
      <img
        src={`http://localhost:5000/images/${props.item.image}`}
        class="card-img-top"
        alt="..."
      />
      <h5 className="card-title">{props.item.name}</h5>
      <h5 className="card-title">Price : {props.item.price}</h5>
      <h5 className="card-title">Quantity : {props.item.quantity}</h5>
      <h5 className="card-title">Created On : {props.item.created_on}</h5>
    </div>
          
  </div>
);



export default class Orders extends Component {
  constructor(props) {
    super(props);

    this.state = { orders: [] };
  }

  componentDidMount() {
    axios
      .get(`http://localhost:5000/orders/:id`)
      .then(response => {
        this.setState({ orders: response.data });
        console.log(response.data);
      })
      .catch(error => {
        console.log(error);
      });
  }


  render() {
    return ( <div className="container">
      {this.state.orders.map(currentItem => {
        return (
          <Item
            item={currentItem}
            push={this.props.history.push}
            key={currentItem.product_id}
          />
        );
      })}
    </div>);
  }
}
