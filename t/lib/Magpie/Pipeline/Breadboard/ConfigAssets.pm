package Magpie::Pipeline::Breadboard::ConfigAssets;
use Moose;
extends 'Magpie::Transformer';
with 'Magpie::Dispatcher::RequestParam';
use Bread::Board;
use Magpie::Constants;

__PACKAGE__->register_events(qw( bareservice simplecontainer));

sub bareservice {
    my ($self, $ctxt) = @_;
    my $body = $self->response->body || '';
    $body .= '_configassets_' . '_' . $self->resolve_asset( service => 'somevar' ) . '_';
    $self->response->body( $body );
    return OK;
}

sub simplecontainer {
    my ($self, $ctxt) = @_;
    my $body = $self->response->body || '';
    $body .= '_simplecontainer_' . '_' . $self->resolve_asset( service => 'MyContainer/somevar' ) . '_';
    $self->response->body( $body );
    return OK;
}

1;