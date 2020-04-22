import React, {Component} from 'react';
import LoadSpinner from "../../shared/components/LoadSpinner";
class EventsList extends Component {

    constructor() {
        super();
        this.state = {
            isLoading: true,
            sportId: null,
            events: [],
            error: null
        };
    }

    componentDidMount() {
        this.fetchData(this.props.sportId);
    }
    componentDidUpdate(prevProps, prevState) {
        if (this.props.sportId && (prevProps.sportId !== this.props.sportId))
            this.fetchData(this.props.sportId);
    }

    fetchData(id) {
        fetch('http://localhost:3000/api/v1/sports/events/events-by-sport-id/' + id + '.json')
            .then(res => res.json())
            .then((data) => {
                if (data.result === 'error') {
                    this.setError(data.message);
                } else {
                    this.setState({
                        events: data.items,
                        errorMessage: '',
                        isLoading: false
                    });
                }
            })
            .catch((e) => {
                this.setError(e.message);
            })
    }

    setError(errorMessage) {
        this.setState({error: errorMessage});
    }

    renderEvents(items) {

        return items.map((item, index) => <li><span>{item.description}</span></li>)
    }

    render() {
        if (this.state.isLoading)
            return <LoadSpinner/>;
        else {
            return (
                <ul>
                    {this.renderEvents(this.state.events)}
                </ul>
            )
        }
    }
}

export default EventsList;