import React from 'react'

import Modal from './Modal'
import Icon from '../Icon'
import Button from '../Button'

import './ClosingModal.css'

export default class ClosingModal extends React.Component {
  static propTypes = {
    ...Modal.propTypes
  }

  render() {
    const { onClose, ...props } = this.props

    return (
      <Modal className="ClosingModal modal-lg" onClose={onClose} {...props}>
        <div className="banner">
          <h2>
            <Icon name="A-Quiet-Street-Gallery" /> <p>Thank you for participating</p>
          </h2>
        </div>

        <div className="modal-body">
          <div className="text">
            <h4>Bidding has ended</h4>
            <p>
              Thank you for supporting A Quiet Street Gallery and their online Art 
	      Auction.  Together we are supporting artists from around the world.
            </p>
          </div>

          <div className="text">
            <h4>Outbid Return</h4>
            <p>
              If you are not the winning bidder your funds will be returned to 
	      your account. If you don't see your returned funds within seven days 
	      after the auction has ended and believe there has been a mistake, 
	      check your address stats page for transactions and make sure you're
              using the address you used for the auction. If you still see a
              mistake, reach out to us on{' '}
              <a href="https://chat.aquietstgallery.com/channel/general">
                RocketChat
              </a>.
            </p>
          </div>

          <div className="text">
            <h4>Auction Statistics</h4>
            <p>
              Average art piece price: .5 btc.
              For a full list of{' '}
              <a href="https://auction.aquietstgallery.com/stats">
                global auction stats
              </a>, check out the stats page.
            </p>
          </div>

          <div className="get-started">
            <Button type="primary" onClick={onClose}>
              Explore Genesis City
            </Button>
          </div>
        </div>
      </Modal>
    )
  }
}
