import React, {Component} from 'react';
import LoadSpinner from "../../shared/components/LoadSpinner";
import EventsList from "./EventsList";
import {Message} from "primereact/message";


export class SportsBoard extends Component {

    constructor() {
        super();
        this.state = {
            isLoading: true,
            sport: null
        };
    }

    componentDidMount() {
        this.fetchData(this.props.match.params.id);
    }

    componentDidUpdate(prevProps, prevState) {
        if (this.props.match.params.id && (prevProps.match.params.id !== this.props.match.params.id))
            this.fetchData(this.props.match.params.id);
    }

    fetchData(id) {
        fetch('http://localhost:3000/api/v1/sports/sport-by-id/' + id + '.json')
            .then(res => res.json())
            .then((data) => {
                if (data.result === 'error') {
                    this.setError(data.error);
                } else {
                    this.setState({
                        sport: data.items[0],
                        errorMessage: '',
                        isLoading: false
                    });
                }
            })
            .catch((e) => {
                this.setError(e.message);
            })
    }

    setError(message) {
        this.setState({
            errorMessage: message
        })
    }

    render() {
        return (this.state.isLoading ?
                <LoadSpinner/> :
                <div>
                    {(this.state.errorMessage ? <Message severity="error" text={this.state.errorMessage}></Message> : '' )}
                    <h2>{this.state.sport.description}</h2>
                    <h2>{this.props.test}</h2>
                    <EventsList sportId={this.state.sport.id}/>
                </div>
        );
    }
}