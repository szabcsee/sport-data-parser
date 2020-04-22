import React, {Component} from 'react';
import LoadSpinner from "../../shared/components/LoadSpinner";
import {Accordion,AccordionTab} from 'primereact/accordion';
import OutcomeList from "./OutcomeList";
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
        return items.map((item, index) => <AccordionTab id={item.id} header={item.description}><OutcomeList eventId={item.id}/></AccordionTab>)
    }

    render() {
        if (this.state.isLoading)
            return <LoadSpinner/>;
        else {
            return (
                <Accordion activeIndex={this.state.activeIndex} onTabChange={(e) => this.setState({activeIndex: e.index})}>
                {this.renderEvents(this.state.events)}
                </Accordion>
            )
        }
    }
}

export default EventsList;